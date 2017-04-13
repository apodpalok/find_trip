require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  describe 'POST#create' do
    before { login_user }

    let(:user) { FactoryGirl.create(:user) }

    subject do
      post :create, params: { review: FactoryGirl.attributes_for(:review),
                              user_id: user.id }
    end

    it 'create review' do
      expect { subject }.to change(Review, :count).by(1)
    end

    it 'create instance of reviews' do
      post :create, params: { review: FactoryGirl.attributes_for(:review),
                              user_id: user.id }
      expect(assigns(:review)).to be_a(Review)
    end

    it 'redirect to user' do
      expect(subject).to redirect_to(user)
    end
  end

  describe 'DELETE#destroy' do
    before { login_user }

    let(:user) { FactoryGirl.create(:user) }
    let(:review) { FactoryGirl.create(:review, user_id: user.id) }

    subject { delete :destroy, params: { id: review.id, user_id: user.id } }

    it 'delete review' do
      expect { subject }.not_to change(Review, :count)
    end

    it 'redirect to user' do
      expect(subject).to redirect_to(user)
    end
  end
end
