class AddColumnToVersion < ActiveRecord::Migration[6.1]
  def change
    add_column :versions, :user_id, :integer
  end
end
