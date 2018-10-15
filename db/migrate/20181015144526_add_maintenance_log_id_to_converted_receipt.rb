class AddMaintenanceLogIdToConvertedReceipt < ActiveRecord::Migration[5.2]
  def change
    add_column :converted_receipts, :maintenance_log_id, :integer
  end
end
