class DashboardController < ApplicationController

  def index
    @interest = Job.interest_count
    @top_companies = Job.top_companies
    @location = Job.location_count
  end

end
