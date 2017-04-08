class ReviewsController < ApplicationController
  before_action :find_user

  def create
    @review = @user.reviews.create(review_params)
    redirect_to @user
  end

  def destroy
    @review = @user.reviews.find(params[:id])
    @review.destroy
    redirect_to @user
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment).merge(author_id: current_user.id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
