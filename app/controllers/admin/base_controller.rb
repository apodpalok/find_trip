module Admin 
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :only_admins

    def only_admins
      return if current_user.admin?
      redirect_to root_path, alert: 'You have no permissions to access this page'
    end
  end
end
