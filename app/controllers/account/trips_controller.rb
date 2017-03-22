module Account
  class TripsController < BaseController
    before_action :find_trip, only: [:show]

    def index
      @trips = current_user.trips
    end
    def show; end

    def find_trip
      @trip = Trip.find(params[:id])
    end
  end
end