class ReviewsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @review = @user.reviews.create(review_params)
    redirect_to @user
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
