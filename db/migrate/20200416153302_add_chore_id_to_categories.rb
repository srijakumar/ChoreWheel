class AddChoreIdToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :chore_id, :integer
  end
end
