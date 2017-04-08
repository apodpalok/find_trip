require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  describe 'GET#index' do
    subject { get :index }

    it 'has status success' do
      is_expected.to have_http_status(200)
    end

    it 'render template show' do
      is_expected.to render_template(:index)
    end
  end

  describe 'GET#show' do
    trip = FactoryGirl.create(:trip)
    subject { get :show, params: { id: trip.id } }

    it 'has status success' do
      is_expected.to have_http_status(:success)
    end

    it 'render template show' do
      is_expected.to render_template :show
    end
  end

  describe 'GET#new' do
    before do
      login_user
    end

    it 'create a new trip' do
      get :new
      expect(assigns(:trip)).to be_a_new(Trip)
    end
  end

  describe 'POST#create' do
    before(:each) do
      login_user
    end

    context 'with valid params' do
      subject do
        post :create, params: { trip: FactoryGirl.attributes_for(:trip) }
      end

      it 'add trip to user' do
        trip = FactoryGirl.build(:trip)
        user = FactoryGirl.build(:user)
        user.trips << trip
        expect(user.trips).to include(trip)
      end

      it 'create trip' do
        expect { subject }.to change(Trip, :count).by(1)
      end

      it 'instance of Trips' do
        post :create, params: { trip: FactoryGirl.attributes_for(:trip) }
        expect(assigns(:trip)).to be_a(Trip)
      end

      it 'has status found' do
        expect(subject).to have_http_status(:found)
      end

      it 'redirect to trip' do
        expect(subject).to redirect_to(Trip.last)
      end

      it 'add trip to user' do
      end
    end

    context 'with invalid params' do
      subject do
        post :create, params: { trip: FactoryGirl.attributes_for(:trip, price: nil) }
      end

      it 'render new template' do
        is_expected.to render_template('new')
      end
    end
  end

  describe 'DELETE#destroy' do
    before(:each) do
      login_user
    end

    trip = FactoryGirl.create(:trip)
    subject { delete :destroy, params: { id: trip.id } }

    it 'delete trip' do
      expect { subject }.to change(Trip, :count).by(-1)
    end

    it 'redirect to trips_path' do
      is_expected.to redirect_to(trips_path)
    end
  end
end
