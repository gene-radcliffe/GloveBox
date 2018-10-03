class CreateMaintenanceLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :maintenance_logs do |t|
      t.string :images
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
