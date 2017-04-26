describe CarManufactory do
  context 'associations' do
    it { should have_many(:manufactory_car_models) }
    it { should have_many(:car_models).through(:manufactory_car_models) }
    it { should have_many(:cars).inverse_of(:car_manufactory) }
  end
end
