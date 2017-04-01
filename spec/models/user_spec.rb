require 'rails_helper'

describe User do
  context 'associations' do
    it { should have_many(:cars) }
    it { should have_many(:trip_memberships) }
    it { should have_many(:trips).through(:trip_memberships) }
    it { should have_and_belong_to_many(:trips_as_driver) }
  end
end
