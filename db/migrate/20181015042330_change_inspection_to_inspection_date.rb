class ChangeInspectionToInspectionDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :vehicles, :inspection, :inspection_date
  end
end
