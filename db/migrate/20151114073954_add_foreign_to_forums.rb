class AddForeignToForums < ActiveRecord::Migration
  def change
    add_column :forums, :category_id, :integer, :auto_increment => false
  end
end
