class MaintenanceLog < ApplicationRecord
  
  has_many :maintenance_actions, dependent: :destroy
  belongs_to :vehicle

end
