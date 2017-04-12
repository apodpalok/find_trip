require 'rails_helper'

describe TripMembership do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:trip) }
  end
end
