describe Account::CarsController, type: 'controller' do
  it_should_behave_like "logged-in only controller"

  let(:user) { build_stubbed(:user) }
  let(:cars) { double("CarsAssociation") }
  let(:car) { build_stubbed(:car) }

  before(:each) do
    sign_in(user)
  end

  describe 'GET index' do
    before(:each) do
      expect(user).to receive(:cars).and_return(cars)
      get :index
    end

    it "should be success" do
      expect(response).to be_success
    end

    it "should render template" do
      expect(response).to render_template(:index)
    end

    it "should assign user_cars" do
      expect(assigns(:user_cars)).to be == cars
    end
  end

  describe 'GET new' do
    before(:each) do
      expect(user).to receive(:cars).and_return(cars)
      expect(cars).to receive(:build).and_return(car)
      get :new
    end

    it "should be success" do
      expect(response).to be_success
    end

    it "should render template" do
      expect(response).to render_template(:new)
    end

    it "should assign car" do
      expect(assigns(:car)).to be == car
    end
  end

  describe 'GET edit' do
    before(:each) do
      expect(user).to receive(:cars).and_return(cars)
      expect(cars).to receive(:find).and_return(car)
      get :edit, params: { id: car.to_param }
    end

    it "should be success" do
      expect(response).to be_success
    end

    it "should render 'edit' template" do
      expect(response).to render_template(:edit)
    end

    it "should assign car" do
      expect(assigns(:car)).to be == car
    end
  end

  describe 'POST create' do
    before(:each) do
      expect(user).to receive(:cars).and_return(cars)
      expect(cars).to receive(:build).and_return(car)
    end

    context "with valid params" do
      before(:each) do
        expect(car).to receive(:save).and_return(true)
        post :create, params: { car: attributes_for(:car) }
      end

      it "should redirect" do
        expect(response).to be_redirect
        expect(response).to redirect_to(account_cars_path)
      end

      it "should assign car" do
        expect(assigns(:car)).to be == car
      end

      it "should assign flash notice" do
        expect(flash[:notice]).to be == "Авто добавлено"
      end
    end

    context "with invalid params" do
      before(:each) do
        expect(car).to receive(:save).and_return(false)
        post :create, params: { car: attributes_for(:car) }
      end

      it "should success" do
        expect(response).to be_success
      end

      it "should render 'new' template" do
        expect(response).to render_template(:new)
      end

      it "should assign car" do
        expect(assigns(:car)).to be == car
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      allow(user).to receive(:cars).and_return(cars)
      allow(cars).to receive(:find).with(car.to_param).and_return(car)
    end

    context "with valid params" do
      before(:each) do
        expect(car).to receive(:update).and_return(true)
        put :update, params: { id: car.to_param, car: attributes_for(:car) }
      end

      it "should redirect" do
        expect(response).to be_redirect
        expect(response).to redirect_to(account_cars_path)
      end

      it "should assign car" do
        expect(assigns(:car)).to be == car
      end

      it "should assign flash notice" do
        expect(flash[:notice]).to be == "Обновлено"
      end
    end

    context "with invalid params" do
      before(:each) do
        expect(car).to receive(:update).and_return(false)
        put :update, params: { id: car.to_param, car: attributes_for(:car) }
      end

      it "should success" do
        expect(response).to be_success
      end

      it "should render 'edit' template" do
        expect(response).to render_template(:edit)
      end

      it "should assign car" do
        expect(assigns(:car)).to be == car
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      allow(user).to receive(:cars).and_return(cars)
      allow(cars).to receive(:find).with(car.to_param).and_return(car)
      expect(car).to receive(:destroy)
      delete :destroy, params: { id: car.to_param }
    end

    it "should redirect" do
      expect(response).to be_redirect
      expect(response).to redirect_to(account_cars_path)
    end

    it "should assign car" do
      expect(assigns(:car)).to be == car
    end
  end
end
