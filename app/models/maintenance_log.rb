class MaintenanceLog < ApplicationRecord
  
  has_many :maintenance_actions
  belongs_to :vehicle, dependent: :destroy

end
