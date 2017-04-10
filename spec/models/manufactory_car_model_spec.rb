require 'rails_helper'

describe ManufactoryCarModel do
  context 'associations' do
    it { should belong_to(:car_manufactory) }
    it { should belong_to(:car_model) }
  end
end
