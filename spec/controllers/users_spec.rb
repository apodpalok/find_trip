require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET#show' do
    before { login_user }

    let(:user) { FactoryGirl.create(:user) }
    let(:review1) { FactoryGirl.create(:review) }
    let(:review2) { FactoryGirl.create(:review, rating: 3) }

    it 'average if reviews are present' do
      user.reviews << review1
      user.reviews << review2
      get :show, params: { id: user.id }
      expect(user.reviews.average(:rating)).to eq(4)
    end

    it 'nil if reviews are absent' do
      get :show, params: { id: user.id }
      expect(user.reviews.average(:rating)).to eq(nil)
    end
  end
end
