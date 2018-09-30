class CreateReviews < ActiveRecord::Migration[4.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :article_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
