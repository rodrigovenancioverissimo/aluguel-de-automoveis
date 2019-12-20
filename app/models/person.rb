class Person < ApplicationRecord
  has_one :active_lease, -> { where(exit_time: nil) }, class_name: 'Lease'
  has_one :license
  has_many :finalized_leases, -> { where.not(exit_time: nil) }, class_name: 'Lease'
  has_many :leases
  has_many :phones

  validates :name, length: { minimum: 3, maximum: 32 }, presence: true
  validates :surname, length: { minimum: 3, maximum: 256 }, presence: true
  validates :cpf, length: 11, presence: true
  validates :date_of_birth, presence: true
  validates :email, length: { maximum: 256 }, presence: true,
            format: { with: /\A([^@\s])@((?:[-a-z0-9]+\\.)[a-z]{2,})\z/i }
end
