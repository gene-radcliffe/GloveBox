class AddPeriodToReminder < ActiveRecord::Migration[5.2]
  def change
    add_column :reminders, :period, :string
  end
end
