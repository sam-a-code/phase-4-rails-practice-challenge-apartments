class RemoveNameFromTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :leases, :name
  end
end
