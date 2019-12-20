class License < ApplicationRecord
  belongs_to :person
  has_many :modalities

  validates :person_id, presence: true
  validates :number, length: 11, presence: true
  validates :validity, presence: true
end
