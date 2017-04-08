module Account
  class ProfilesController < BaseController
    def show; end

    def edit
      @user = current_user
    end

    def update
      current_user.update(user_params)
      render :edit
    end

    def destroy
      current_user.destroy
      redirect_to root_path
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name,
                                    :email, :avatar, :mini_bio, :phone_number,
                                    :postcode, :birth_date, :address, :address2,
                                    :city, :gender, :current_password)
    end
  end
end
