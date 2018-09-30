class AddFigureToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :figure, :string
  end
end
