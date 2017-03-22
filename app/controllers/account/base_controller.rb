module Account
  class BaseController < ApplicationController
    layout 'account'

    before_action :authenticate_user!
    before_action :admin_pages

    private 

    def not_found
      raise ActionController::RoutingError.new('Page Not Found')
    end

    def admin_pages
      redirect_to admin_root_path if current_user.admin?
    end
  end
end