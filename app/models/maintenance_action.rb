class MaintenanceAction < ApplicationRecord
  belongs_to :maintenance_log, dependent: :destroy
end
