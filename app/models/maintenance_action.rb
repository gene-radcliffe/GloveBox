class MaintenanceAction < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :maintenance_log, dependent: :destroy

end
