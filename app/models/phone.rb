class Phone < ApplicationRecord
  before_validation :sanitize_inputs

  belongs_to :person

  enum phone_type: { 'comercial': 0, 'particular': 1, 'trabalho': 2 }

  validates :person_id, presence: true
  validates :ddd, length: { is: 3 }, presence: true
  validates :number, length: { minimum: 8, maximum: 9 }, presence: true
  validates :phone_type, presence: true
  validates :preferential, presence: true

  private
  def sanitize_inputs
    self.number = number.gsub(/[^0-9]/, '')
  end
end
