require 'rails_helper'

describe CarModel do
  context 'associations' do
    it { should have_many(:manufactory_car_models) }
    it { should have_many(:car_manufactories).through(:manufactory_car_models) }
    it { should have_many(:cars).inverse_of(:car_model) }
  end
end
