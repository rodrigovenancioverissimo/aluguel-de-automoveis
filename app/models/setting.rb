class Setting < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 128 }, presence: true
  validates :value, presence: true
end
