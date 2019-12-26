class Person < ApplicationRecord
  before_validation :sanitize_inputs

  has_one :active_lease, -> { where(exit_time: nil) }, class_name: 'Lease'
  has_one :license, dependent: :destroy
  has_one :phone, -> { where(preferential: true) }, class_name: 'Phone'
  has_many :finalized_leases, -> { where.not(exit_time: nil) }, class_name: 'Lease'
  has_many :leases, dependent: :destroy
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :license, allow_destroy: true

  validates :name, length: { minimum: 3, maximum: 32 }, presence: true
  validates :surname, length: { minimum: 3, maximum: 256 }, allow_blank: true
  validates :cpf, length: { is: 11 }, presence: true
  validates :date_of_birth, presence: true
  validates :email, length: { maximum: 256 }, presence: true,
            format: { with: /[^\s\@]+@[^\s\@]+\.[^\s\@]{2,}/ }

  validates :phones, presence: true

  filterrific(
      default_filter_params: { sorted_by: 'model_asc' },
      available_filters: [
          :sorted_by,
          :with_name
      ]
  )

  scope :can_rent_truck, -> {
    Person.joins(license: :modalities)
        .where("date_of_birth < ?", Date.current - 60.years)
        .where(licenses: { modalities: 2 })
  }

  scope :can_lease_for_more_4_days, -> {
    Person.group(:id).joins(:leases).where("leases.entry_time < leases.end_time").having("count(people.id) >= 2")
  }

  scope :license_a_month_to_win, -> {
    Person.joins(:license).where("licenses.validity >= ? and licenses.validity < ?", Date.current - 30.days, Date.current)
  }

  scope :sort_by_lease_cost, -> {
    Person.joins(:active_lease).order(total_price: :desc)
  }

  scope :sorted_by, -> (sort_key){

  }

  scope :with_name, -> (query){
    where("UPPER(people.name) like '%#{query.upcase}%' ")
  }

  def self.options_for_sorted_by
    [
        ["Name (a-z)", "name_asc"],
        ["Name (z-a)", "name_desc"],
    ]
  end

  private
  def sanitize_inputs
    self.cpf = cpf.gsub(/[^0-9]/, '')
    self.name = name.titleize
    self.surname = surname.titleize
  end
end
