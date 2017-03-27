module Account
  class PhotoController < BaseController

    def show
      @user = current_user
    end

    def update
      current_user.update(photo_params)
      redirect_to account_photo_path(current_user.id)
    end

    def destroy
      current_user.avatar.remove!
      redirect_to account_photo_path(current_user.id)
    end

    private

    def current_user_photo?
      # future
    end

    def photo_params
      params.require(:user).permit(:avatar)
    end
  end
end
