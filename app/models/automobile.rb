class Automobile < ApplicationRecord
  before_validation :sanitize_inputs

  has_many :leases

  enum automobile_type: { 'carro': 0, 'caminhão': 1, 'moto': 2, 'ônibus': 3, 'VUC': 4 }
  enum color: { 'amarelo': 0, 'azul': 1, 'branco': 2, 'cinza': 3, 'laranja': 4, 'marrom': 5, 'prata': 6,
                'preto': 7, 'roxo': 8, 'rosa': 9, 'verde': 10, 'vermelho': 11 }

  validates :model, length: { minimum: 1, maximum: 128 }, presence: true
  validates :color, presence: true
  validates :year, inclusion: { in: 1000..3000 }, presence: true
  validates :automobile_type, presence: true
  validates :plaque, length: { is: 7 }, presence: true, uniqueness: true
  validates :daily_cost, length: { maximum: 99999 }, presence: true

  scope :unavailable_on_wednesdays, -> {
    Automobile.where("plaque like '%4'")
  }

  filterrific(
      default_filter_params: { sorted_by: 'model_asc' },
      available_filters: [
          :sorted_by,
          :with_model
      ]
  )

  scope :sorted_by, -> (sort_key){

  }

  scope :with_model, -> (query){
    where("UPPER(automobiles.model) like '%#{query.upcase}%' ")
  }

  def self.options_for_sorted_by
    [
        ["Model (a-z)", "model_asc"],
        ["Model (z-a)", "model_desc"],
    ]
  end

  private
  def sanitize_inputs
    self.plaque = plaque.upcase.gsub(/[^0-9A-Z]/, '')
    self.daily_cost = daily_cost.to_s.gsub(/\,/, '.').gsub(/[^0-9\.]/, '')
  end
end
