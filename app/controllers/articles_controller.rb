class ArticlesController < ApplicationController

  before_action :current_article, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def show
    @review = Review.new
    #退会したユーザーのレビューは表示させない
    @reviews = @article.reviews.joins(:user).includes(:user)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(create_params)

    if params[:back]
      render :new
    elsif @article.save
      flash[:success] = 'アイデアを投稿しました'
      redirect_to controller: :home, action: :index
    else
      render :new
    end

  end

  def edit
  end

  def update
    @article.update(update_params)

    if @article.save
      flash[:success] = 'アイデアを更新しました'
      redirect_to controller: :articles, action: :show
    else
      render :edit
    end

  end

  def destroy
    if @article.user_id == current_user.id
        @article.destroy
    end
    redirect_to controller: :home, action: :index
    flash[:success] = '投稿を削除しました'
  end

  private
  def create_params
    params.require(:article).permit(:title, :category, :detail, :cue, :feature, :point, :remark, :figure ).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:article).permit(:title, :category, :detail, :cue, :feature, :point, :remark, :figure ).merge(user_id: current_user.id)
  end

  #ログインユーザーが他ユーザーの情報を編集するパスを指定した場合はrootへリダイレクトする
  def correct_user
    redirect_to(root_path) unless current_user?(@article.user_id)
  end

  #選択したarticleのインスタンスを取得
  def current_article
      @article = Article.find(params[:id])
  end

end
