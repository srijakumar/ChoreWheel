class AddCategoriesToChores < ActiveRecord::Migration[6.0]
  def change
    add_column :chores, :category_id, :integer
  end
end
