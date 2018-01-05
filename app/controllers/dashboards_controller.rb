class DashboardsController < ApplicationController
  def show
    redirect_to '/login' unless logged_in?

    @user = User.find(session[:user_id])
    @organized_trips = @user.trips
    @travelling_trips = @user.travel_trips
  end
end