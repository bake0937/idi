module ArticlesHelper

  def add_glyphicon_to_category(article)
    if article.category == "web"
      '<span class="glyphicon glyphicon-globe">' + article.category_i18n + '</span>'
    elsif article.category == "mobile"
      '<span class="glyphicon glyphicon-phone">' + article.category_i18n + '</span>'
    elsif article.category == "desk_top"
      '<span class="glyphicon glyphicon-home">' + article.category_i18n + '</span>'
    end
  end

end
