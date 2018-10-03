class CreateMaintenanceActions < ActiveRecord::Migration[5.2]
  def change
    create_table :maintenance_actions do |t|
      t.string :type
      t.integer :mileage
      t.string :oil_type
      t.date :service_date
      t.float :cost
      t.string :tire_location
      t.string :brake_location
      t.string :rotor_location
      t.text :notes
      t.integer :maintenance_log_id

      t.timestamps
    end
  end
end
