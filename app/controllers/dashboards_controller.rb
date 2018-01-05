class DashboardsController < ApplicationController
  def show
    authenticate!

    @user = User.find(session[:user_id])
    @organized_trips = @user.trips
    @travelling_trips = @user.travel_trips
  end
end