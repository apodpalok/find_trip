module Account
  class PhotosController < BaseController

    def edit; end

    def update
      current_user.update(photo_params)
      redirect_to edit_account_photos_path(current_user)
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
