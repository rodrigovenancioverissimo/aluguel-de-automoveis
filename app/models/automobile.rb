class Automobile < ApplicationRecord
  has_many :leases

  enum type: { 'carro': 0, 'caminhão': 1, 'moto': 2, 'ônibus': 3, 'VUC': 4 }
  enum color: { 'amarelo': 0, 'azul': 1, 'branco': 2, 'cinza': 3, 'laranja': 4, 'marrom': 5, 'prata': 6,
                'preto': 7, 'roxo': 8, 'rosa': 9, 'verde': 10, 'vermelo': 11 }

  validates :model, length: { minimum: 3, maximum: 128 }, presence: true
  validates :color, presence: true
  validates :year, inclusion: { in: 1000..3000 }, presence: true
  validates :type, presence: true
  validates :plaque, length: 7, presence: true, uniqueness: true
  validates :daily_cost, length: { maximum: 99999 }, presence: true
end
