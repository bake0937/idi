class ProfilesController < ApplicationController

  before_action :correct_user,   only: [:edit, :update]

  def show
    @profile = Profile.find(params[:id])
    #プロフィールに紐づくユーザー情報を取得
    user = @profile.user
    @articles = Article.where(user_id: user.id).order("articles . updated_at DESC").includes(:user).page(params[:page]).per(8)
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    profile = Profile.find(params[:id])
    profile.update(update_params)
    flash[:success] = 'プロフィール情報を変更しました'
    redirect_to :action => "edit"
  end

  private
  def update_params
    params.require(:profile).permit(:nickname, :introduction, :avatar)
  end

  #ログインユーザーが他ユーザーの情報を編集するパスを指定した場合はログインユーザーのプロフィーページへリダイレクトする
  def correct_user
      @profile = Profile.find(params[:id])
      redirect_to(edit_profile_path(current_user.profile.id)) unless current_user?(@profile.user_id)
  end

end
