class ReviewsController < ApplicationController
  def create
    @review = Review.create(create_params)
    @article = Article.find(params[:article_id])
    @reviews = @article.reviews.joins(:user).includes(:user)
  end

  def destroy
    article = Article.find(params[:article_id])
    review = article.reviews.find(params[:id])
      if review.user_id == current_user.id
        review.destroy
      end
    redirect_to controller: :articles, action: :show, id: params[:article_id]
    flash[:success] = 'コメントを削除しました'
  end

  private
  def create_params
    params.require(:review).permit(:comment).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
