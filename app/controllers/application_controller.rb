class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def not_found
    raise ActionController::RoutingError, 'Page Not Found'
  end
end
