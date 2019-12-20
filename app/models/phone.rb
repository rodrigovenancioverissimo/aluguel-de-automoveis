class Phone < ApplicationRecord
  belongs_to :person

  enum type: { 'comercial': 0, 'particular': 1, 'trabalho': 2 }

  validates :person_id, presence: true
  validates :ddd, length: 3, presence: true
  validates :number, length: { minimum: 8, maximum: 9 }, presence: true
  validates :type, presence: true
  validates :preferential, presence: true
end
