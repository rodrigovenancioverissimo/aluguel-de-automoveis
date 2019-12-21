class License < ApplicationRecord
  belongs_to :person
  has_many :modalities

  accepts_nested_attributes_for :modalities, allow_destroy: true

  validates :person_id, presence: true
  validates :number, length: { minimum: 10, maximum: 11 }, presence: true
  validates :validity, presence: true
end
