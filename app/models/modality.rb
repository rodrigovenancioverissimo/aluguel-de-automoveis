class Modality < ApplicationRecord
  belongs_to :license
  validates :license_id, presence: true
  validates :name, presence: true
end
