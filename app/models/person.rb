class Person < ApplicationRecord
  before_validation :sanitize_inputs

  has_one :active_lease, -> { where(exit_time: nil) }, class_name: 'Lease'
  has_one :license
  has_one :phone, -> { where(preferential: true) }, class_name: 'Phone'
  has_many :finalized_leases, -> { where.not(exit_time: nil) }, class_name: 'Lease'
  has_many :leases
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :license, allow_destroy: true

  validates :name, length: { minimum: 3, maximum: 32 }, presence: true
  validates :surname, length: { minimum: 3, maximum: 256 }, allow_blank: true
  validates :cpf, length: { is: 11 }, presence: true
  validates :date_of_birth, presence: true
  validates :email, length: { maximum: 256 }, presence: true,
            format: { with: /[^\s\@]+@[^\s\@]+\.[^\s\@]{2,}/ }

  private
  def sanitize_inputs
    self.cpf = cpf.gsub(/[^0-9]/, '')
    self.name = name.titleize
    self.surname = surname.titleize
  end
end
