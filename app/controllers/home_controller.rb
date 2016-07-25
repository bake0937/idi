class HomeController < ApplicationController

  def index
    @articles = Article.joins(:user).order("articles . updated_at DESC").page(params[:page]).per(8)
  end

end
