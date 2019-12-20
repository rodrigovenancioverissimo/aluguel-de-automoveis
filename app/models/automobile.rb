class Automobile < ApplicationRecord
  has_many :leases

  validates :model, length: { minimum: 3, maximum: 128 }, presence: true
  validates :color, presence: true
  validates :year, inclusion: { in: 1000..3000 }, presence: true
  validates :type, presence: true
  validates :plaque, length: 7, presence: true, uniqueness: true
  validates :daily_cost, length: { maximum: 99999 }, presence: true
end
