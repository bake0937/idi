class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(create_params)
    redirect_to controller: :home, action: :index
  end

  private
  def create_params
    params.require(:article).permit(:title, :category, :detail, :cue, :feature, :point, :remark ).merge(user_id: current_user.id)
  end

end
