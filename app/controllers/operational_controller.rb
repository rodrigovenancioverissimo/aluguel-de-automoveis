class OperationalController < ApplicationController
  before_action { @sidebar = 'operational' }

  def new_leases
    @leases = Lease.all
  end
  def entry_and_exit_of_leases
  end
  def late_leases
  end
end