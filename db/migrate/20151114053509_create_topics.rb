class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :last_poster_id
      t.datetime :last_posted_at

      t.timestamps null: false
    end
  end
end
