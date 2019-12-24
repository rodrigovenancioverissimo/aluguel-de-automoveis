class Phone < ApplicationRecord
  before_validation :sanitize_inputs

  belongs_to :person

  enum phone_type: { 'comercial': 0, 'particular': 1, 'trabalho': 2 }

  validates :person, presence: true
  validates :ddd, length: { minimum: 1, maximum: 3 }, presence: true
  validates :number, length: { minimum: 8, maximum: 9 },
            uniqueness: {
                escope: [:ddd, :person],
                message: 'um ou mais números repetidos'
            },
            presence: true
  validates :phone_type, presence: true
  validates :preferential, inclusion: { in: ['true', true, 'false', false] }

  private
  def sanitize_inputs
    self.number = number.gsub(/[^0-9]/, '')
  end
end
