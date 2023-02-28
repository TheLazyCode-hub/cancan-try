class CreateApprovals < ActiveRecord::Migration[6.1]
  def change
    create_table :approvals do |t|
      t.references :approvable, polymorphic: true
      t.string :status, default: 'pending'
      t.timestamps
    end
  end
end
