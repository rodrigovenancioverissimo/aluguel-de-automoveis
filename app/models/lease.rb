class Lease < ApplicationRecord
  belongs_to :person
  belongs_to :automobile

  validates :person_id, presence: true
  validates :automobile_id, presence: true
  validates :start_time, presence: true

  #Lease.select('sum(leases.total_price) as price_all_car').joins(:automobile).where(automobiles: { automobile_type: 0 }).first.price_all_car
end
