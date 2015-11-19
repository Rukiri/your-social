class AddSlugToForumThreads < ActiveRecord::Migration
  def change
    add_column :forum_threads, :slug, :string
    add_index :forum_threads, :slug
  end
end
