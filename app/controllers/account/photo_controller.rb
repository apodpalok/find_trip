module Account
  class PhotoController < BaseController

    def index
      @user = current_user
    end 

    def update
      current_user.update(photo_params)
      redirect_to account_photo_index_path
    end

    def destroy
      current_user.avatar.remove!
      redirect_to account_photo_index_path
    end

    private

    def photo_params
      params.require(:user).permit(:avatar)
    end
  end
end
