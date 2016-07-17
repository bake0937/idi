class ReviewsController < ApplicationController
  def create
    @review = Review.create(create_params)
    redirect_to article_path(params[:article_id])
  end

  private
  def create_params
    params.require(:review).permit(:comment).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
