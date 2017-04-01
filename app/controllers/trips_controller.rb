class TripsController < ApplicationController
  before_action :find_trip, only: [:destroy, :show, :add_passenger, :delete_passenger]
  after_action :add_trip_to_user, only: [:create, :add_passenger]

  def index
    @trips = search
    @trips = sorting
  end

  def show; end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      @trip.drivers << current_user
      redirect_to @trip, alert: 'Поездку добавлено.'
    else
      render 'new'
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path, alert: 'Поездку удалено.'
  end

  def add_passenger
    @trip.passengers << current_user
    redirect_to @trip
  end

  def delete_passenger
    current_user.trips.delete(@trip)
    @trip.passengers.delete(current_user)
    redirect_to @trip
  end

  private

  def trip_params
    params.require(:trip).permit(:start_location, :finish_location, :start_time, :finish_time, :duration, :distance,
                                 :price, :latitude, :longitude)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end

  def search
    Trip.search(params[:start_location], params[:finish_location], params[:min_price], params[:max_price])
  end

  def sorting
    @trips.order(["#{params[:sort_param]} #{params[:sort_trend]}"])
  end

  def add_trip_to_user
    current_user.trips << @trip
  end
end
