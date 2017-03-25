class TripsController < ApplicationController
  def index
    @trips = if params[:search_from] && params[:search_to]
               search
             else
               Trip.all
             end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to @trip
    else
      render 'new'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:start_location, :finish_location, :start_time, :finish_time, :duration, :distance,
                                 :price, :latitude, :longitude)
  end

  def search
    @trips = Trip.search(params[:search_from], params[:search_to])
  end
end
