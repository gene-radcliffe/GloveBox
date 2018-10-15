class ChangeInspectionToDateType < ActiveRecord::Migration[5.2]
  def change
    change_column :vehicles, :inspection_date, 'integer USING CAST(inspection_date AS integer)'
  end
end
