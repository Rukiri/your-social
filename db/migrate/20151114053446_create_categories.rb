class CreateCategories < ActiveRecord::Migration
  drop_table :categories
  drop_table :forums
  drop_table :topics
  drop_table :posts
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
