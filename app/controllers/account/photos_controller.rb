module Account
  class PhotosController < BaseController

    def edit; end

    def update
      current_user.update(photo_params)
      redirect_to edit_account_photo_path
    end

    def destroy
      @user = current_user
      @user.remove_avatar!
      @user.save
      redirect_to edit_account_photo_path
    end

    private

    def photo_params
      params.require(:user).permit(:avatar)
    end
  end
end
