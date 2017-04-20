class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = FormUser.find(params[:id])
    @reviews = @user.reviews
    @average_review = if @reviews.blank?
                        0
                      else
                        @reviews.average(:rating).to_f.round(2)
                      end
  end
end
