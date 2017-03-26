module Account
  class ProfileController < BaseController
    before_action :find_user, only: [:show, :edit, :update]
    before_action :check_autorization

    def show; end

    def edit; end

    def update
      @user.update(user_params)
      redirect_to edit_account_profile_path(@user.id)
    end

    private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name,
                                    :email, :avatar, :mini_bio, :phone_number,
                                    :postcode, :birth_date, :address, :address2,
                                    :city, :gender)
    end

    def check_autorization
      return if current_user.id == params[:id].to_i
      not_found
    end
  end
end
