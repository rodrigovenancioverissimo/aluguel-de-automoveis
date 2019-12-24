class License < ApplicationRecord
  belongs_to :person
  has_many :modalities, dependent: :destroy

  accepts_nested_attributes_for :modalities, allow_destroy: true

  validates :person, presence: true
  validates :number, length: { minimum: 10, maximum: 11 }, presence: true, uniqueness: true
  validates :validity, presence: true
end
