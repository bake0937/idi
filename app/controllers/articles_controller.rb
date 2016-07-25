class ArticlesController < ApplicationController

  before_action :correct_user,   only: [:edit, :update]

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

  def edit
    @article = Article.find(params[:id])

  end

  def update
    article = Article.find(params[:id])
    article.update(update_params)
    flash[:success] = '更新しました'
    redirect_to controller: :home, action: :index
  end

  private
  def create_params
    params.require(:article).permit(:title, :category, :detail, :cue, :feature, :point, :remark ).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:article).permit(:title, :category, :detail, :cue, :feature, :point, :remark ).merge(user_id: current_user.id)
  end

  #ログインユーザーが他ユーザーの情報を編集するパスを指定した場合はrootへリダイレクトする
  def correct_user
      @article = Article.find(params[:id])
      redirect_to(root_path) unless current_user?(@article.user_id)
  end

end
