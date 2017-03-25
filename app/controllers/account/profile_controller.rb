module Account
  class ProfileController < BaseController
    before_action :find_user, only: [:show, :edit, :update]
    before_action :current_user_profile?

    def show; end

    def edit; end

    def update; end

    private

    def find_user
      @user = User.find(params[:id])
    end

    def current_user_profile?
      return if current_user.id == User.find(find_user).id
      not_found
    end
  end
end
