class HomeController < ApplicationController

  def index
    @articles = Article.joins(:user).order("articles . updated_at DESC").includes([user: :profile]).page(params[:page]).per(8)
    @slides = Article.joins(:user).order('RAND()').limit(5)
  end

end
