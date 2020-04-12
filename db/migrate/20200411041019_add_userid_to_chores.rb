class AddUseridToChores < ActiveRecord::Migration[6.0]
  def change
    add_column :chores, :user_id, :integer
  end
end
