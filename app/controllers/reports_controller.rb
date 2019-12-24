class ReportsController < ApplicationController
  before_action { @sidebar = 'administration' }
  def financial
    @cost_of_car_leases = Lease.cost_of_car_leases
    @leases_in_progress = Lease.leases_in_progress.page(params[:leases_in_progress_page])
  end

  def customers
    @late_people = Lease.late_people.page(params[:late_people_page]).per(5)
    @can_rent_truck = Person.can_rent_truck.page(params[:can_rent_truck_page]).per(5)
    @can_lease_for_more_4_days = Person.can_lease_for_more_4_days.page(params[:can_lease_for_more_4_days_page]).per(5)
    @license_a_month_to_win = Person.license_a_month_to_win.page(params[:license_a_month_to_win_page]).per(5)
  end

  def automobiles
    @unavailable_on_wednesdays = Automobile.unavailable_on_wednesdays.page(params[:unavailable_on_wednesdays_page])
  end
end