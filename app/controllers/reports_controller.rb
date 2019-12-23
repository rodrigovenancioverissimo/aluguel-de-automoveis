class ReportsController < ApplicationController
  before_action { @sidebar = 'administration' }
  def financial
    @cost_of_car_leases = Lease.cost_of_car_leases
    @leases_in_progress = Lease.leases_in_progress
  end

  def customers
    @late_people = Lease.late_people
    @can_rent_truck = Person.can_rent_truck
    @can_lease_for_more_4_days = Person.can_lease_for_more_4_days
    @license_a_month_to_win = Person.license_a_month_to_win
  end

  def automobiles
    @unavailable_on_wednesdays = Automobile.unavailable_on_wednesdays
  end
end