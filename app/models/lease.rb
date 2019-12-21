class Lease < ApplicationRecord
  belongs_to :person
  belongs_to :automobile

  validates :person_id, presence: true
  validates :automobile_id, presence: true
  validates :start_time, presence: true
end
