class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @average_review = if @reviews.blank?
                        0
                      else
                        @reviews.average(:rating).round(2)
                      end
  end
end
