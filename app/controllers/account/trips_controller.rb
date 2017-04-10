module Account
  class TripsController < BaseController
    before_action :find_trip, only: [:show]

    def index; end

    def show; end

    def active
      @trips = current_user.trips.where(status: :active)
      render :index
    end

    def archived
      @trips = current_user.trips.where(status: :archived)
      render :index
    end

    private

    def find_trip
      @trip = Trip.find(params[:id])
    end
  end
end