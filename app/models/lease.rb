class Lease < ApplicationRecord
  belongs_to :person
  belongs_to :automobile

  validates :person_id, presence: true
  validates :automobile_id, presence: true
  validates :start_time, presence: true

  scope :cost_of_car_leases, -> {
    Lease.select('sum(leases.total_price) as price_all_car')
        .joins(:automobile)
        .where(automobiles: { automobile_type: 0 })
        .first.price_all_car
  }

  scope :late_people, -> {
    Lease.select("people.name || ' ' || people.surname AS full_name")
        .select("CAST(strftime('%s', leases.entry_time) - CAST(strftime('%s', leases.end_time) as integer) as integer) as diff")
        .joins(:person).where("leases.end_time < leases.entry_time")
  }

  scope :leases_in_progress, -> {
    Lease.where(entry_time: nil)
  }
end
