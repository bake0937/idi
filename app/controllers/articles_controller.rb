class ArticlesController < ApplicationController

  before_action :correct_user,   only: [:edit, :update]

  def show
    @review = Review.new
    @article = Article.find(params[:id])
    #退会したユーザーのレビューは表示させない
    @reviews = @article.reviews.joins(:user).includes(:user)
  end

  def new
    @article = Article.new
  end

  def create

    # @article = Article.create
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
    @article = Article.find(params[:id])
  end

  def update

    @article = Article.find(params[:id])
    @article.update(update_params)

    if @article.save
      flash[:success] = 'アイデアを更新しました'
      redirect_to controller: :articles, action: :show
    else
      render :edit
    end

  end

  def destroy
    article = Article.find(params[:id])
      if article.user_id == current_user.id
        article.destroy
      end
    redirect_to controller: :home, action: :index
    flash[:success] = '投稿を削除しました'
  end

  def confirm
    #POSTされたパラメータを取得
    @article = Article.new(create_params)
    #validetesをチェックし、NGなら戻す
    render :new if @article.invalid?
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
      @article = Article.find(params[:id])
      redirect_to(root_path) unless current_user?(@article.user_id)
  end

end
