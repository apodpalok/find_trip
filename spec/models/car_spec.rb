require 'rails_helper'

describe Car do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:car_manufactory).inverse_of(:cars) }
    it { should belong_to(:car_model).inverse_of(:cars) }
  end
end
