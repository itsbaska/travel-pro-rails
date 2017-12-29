class FlightsController < ApplicationController

  def index
    authenticate!
    @trip = Trip.find(params[:trip_id])
    @flights = @trip.flights
  end

  def new
    authenticate!
    @trip = Trip.find(params[:trip_id])
    @flight = Flight.new
  end

  def create
    authenticate!
    @trip = Trip.find(params[:trip_id])
    @travelgroup = Travelgroup.create(traveller: current_user, trip: @trip)
    @flight = Flight.new(flight_params)
    @flight.travelgroup = @travelgroup

    if @flight.save
      redirect_to @trip
    else
      render component: 'NewInbound', props: {errors: @flight.errors.full_messages, trip: @trip}
    end
  end

  private
    def flight_params
      params.permit(:airline, :arrival, :departure, :airport, :outbound)
    end
end