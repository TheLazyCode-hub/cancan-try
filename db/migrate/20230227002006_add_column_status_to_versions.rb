class AddColumnStatusToVersions < ActiveRecord::Migration[6.1]
  def change
    add_column :versions, :status, :string, default: 'pending'
  end
end
