describe Trip do
  context 'associations' do
    it { should have_many(:trip_memberships).dependent(:destroy) }
    it { should have_many(:users).through(:trip_memberships) }
    it { should have_and_belong_to_many(:drivers) }
    it { should have_and_belong_to_many(:passengers) }
  end

  context 'validations' do
    context 'have a valid factory' do
      it { expect(build(:trip)).to be_valid }
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

      it 'if seats is not integer' do
        expect(build(:trip, seats: '2.5')).to_not be_valid
      end

      it 'if seats is less 0' do
        expect(build(:trip, seats: '-1')).to_not be_valid
      end

      it 'if price is not integer' do
        expect(build(:trip, price: '99.9')).to_not be_valid
      end

      it 'if price is less 0' do
        expect(build(:trip, price: '-8')).to_not be_valid
      end

      it 'start time cannot be in the past' do
        expect(build(:trip, start_time: DateTime.now - 1.day)).to_not be_valid
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
      expect(trip.duration).to be(10123)
    end

    it 'set finish_time' do
      finish_time = trip.start_time + trip.duration
      expect(trip.finish_time).to eq(finish_time)
    end
  end

  context 'methods' do
    trip = FactoryGirl.create(:trip)

    context '#search' do
      it 'with valid params' do
        expect(Trip.search('Киев', 'Черкассы', Date.today + 1.day, 10, 100)).to include(trip)
      end

      it 'with invalid params' do
        expect(Trip.search('Львов', 'Черкассы', Date.today + 1.day, 10, 100)).to_not include(trip)
      end
    end
  end
end
