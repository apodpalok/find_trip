class HomeController < ApplicationController
  def index
    return unless user_signed_in?
    redirect_to admin_root_path if current_user.admin?
  end
end
