class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
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
    params.require(:profile).permit(:nickname, :text)
  end

end
