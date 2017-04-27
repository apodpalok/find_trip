shared_examples 'logged-in only controller' do |params = ActionController::Parameters.new|
  actions = described_class.instance_methods(false)
  params = params.to_unsafe_h

  before :each do
    sign_in nil
  end

  if actions.include?(:index)
    describe 'GET index' do
      it 'should redirect' do
        get :index, params: params
        expect(response).to be_redirect
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to be == 'You need to sign in or sign up before continuing.'
      end
    end
  end

  if actions.include?(:new)
    describe 'GET new' do
      it 'should redirect' do
        get :new, params: params
        expect(response).to be_redirect
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to be == 'You need to sign in or sign up before continuing.'
      end
    end
  end

  if actions.include?(:create)
    describe 'POST create' do
      it 'should redirect' do
        post :create, params: params
        expect(response).to be_redirect
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to be == 'You need to sign in or sign up before continuing.'
      end
    end
  end

  if actions.include?(:edit)
    describe 'GET edit' do
      it 'should redirect' do
        get :edit, params: params.merge(id: 1)
        expect(response).to be_redirect
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to be == 'You need to sign in or sign up before continuing.'
      end
    end
  end

  if actions.include?(:update)
    describe 'PUT update' do
      it 'should redirect' do
        put :update, params: params.merge(id: 1)
        expect(response).to be_redirect
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to be == 'You need to sign in or sign up before continuing.'
      end
    end
  end

  if actions.include?(:destroy)
    describe 'DELETE destroy' do
      it 'should redirect' do
        delete :destroy, params: params.merge(id: 1)
        expect(response).to be_redirect
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to be == 'You need to sign in or sign up before continuing.'
      end
    end
  end
end
