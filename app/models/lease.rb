class Lease < ApplicationRecord
  belongs_to :person
  belongs_to :automobile

  validates :person_id, presence: true
  validates :automobile_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  scope :cost_of_car_leases, -> {
    Lease.select('sum(leases.total_price) as price_all_car')
        .joins(:automobile)
        .where(automobiles: { automobile_type: 0 })[0].price_all_car
  }

  scope :late_people, -> {
    delayToleranceInSeconds = SettingsHelper.getDelayToleranceInSeconds
    Lease.select('leases.*')
        .select("people.name || ' ' || people.surname AS full_name")
        .select("EXTRACT(epoch FROM (leases.entry_time - leases.end_time)) as diff")
        .joins(:person).where("EXTRACT(epoch FROM (leases.end_time - leases.entry_time)) < ?", -delayToleranceInSeconds)
  }

  scope :leases_in_progress, -> {
    Lease.where(entry_time: nil)
  }
end
