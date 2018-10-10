class AddSelectedToMaintenanceActions < ActiveRecord::Migration[5.2]
  def change
    add_column :maintenance_actions, :selected, :boolean
  end
end
