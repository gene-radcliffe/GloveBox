class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.string :type
      t.date :action_date
      t.text :notes

      t.timestamps
    end
  end
end
