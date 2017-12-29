class TripsController < ApplicationController
  def index
  end

  def new
    authenticate!
    @trip = Trip.new
  end

   def create
    authenticate!
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to @trip
    else
      render component: 'NewTrip', props: {errors: @trip.errors.full_messages}
    end
  end

  def show
    authenticate!
    @trip = Trip.find(params[:id])
    @travellers = @trip.travellers
    @amount = @trip.data_array
    @purchasers = @trip.purchasers_array
  end

  private
  def trip_params
    params.permit(:name, :location, :start_date, :end_date, :budget).merge(organizer: current_user)
  end
end