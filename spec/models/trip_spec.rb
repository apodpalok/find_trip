require 'rails_helper'

describe Trip do
  context 'validates' do
    it 'has a valid factory' do
      expect(build(:trip)).to be_valid
    end

    context 'is invalid' do
      it 'without a start_location' do
        expect(build(:trip, start_location: nil)).to_not be_valid
      end

      it 'without a finish_location' do
        expect(build(:trip, finish_location: nil)).to_not be_valid
      end

      it 'without a start_time' do
        expect(build(:trip, start_time: nil)).to_not be_valid
      end

      it 'without a price' do
        expect(build(:trip, price: nil)).to_not be_valid
      end

      it 'if price is not integer' do
        expect(build(:trip, price: '99.9')).to_not be_valid
      end

      it 'if price is less 0' do
        expect(build(:trip, price: '-8')).to_not be_valid
      end
    end
  end

  context 'callbacks' do
    trip = FactoryGirl.create(:trip)
    trip.run_callbacks :create

    it 'geocode start_latitude' do
      expect(trip.start_latitude).to be(50.4501)
    end

    it 'geocode start_longitude' do
      expect(trip.start_longitude).to be(30.5234)
    end

    it 'geocode finish_latitude' do
      expect(trip.finish_latitude).to be(49.444433)
    end

    it 'geocode finish_longitude' do
      expect(trip.finish_longitude).to be(32.059767)
    end

    it 'set distance' do
      expect(trip.distance).to be(191.0)
    end

    it 'set duration' do
      expect(trip.duration).to be(10_216)
    end

    it 'set finish_time' do
      finish_time = DateTime.new(2017, 3, 30, 13, 50, 16)
      expect(trip.finish_time).to eq(finish_time)
    end
  end

  context 'methods' do
    trip = FactoryGirl.create(:trip)

    it 'Trip.search' do
      expect(Trip.search('Киев', 'Черкассы', 10, 100)).to include(trip)
    end
  end
end
