class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :category
      t.text :detail
      t.text :cue
      t.text :feature
      t.text :point
      t.text :remark
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
