class MaintenanceLog < ApplicationRecord
  
  has_many :maintenance_actions
  belongs_to :vehicle, dependent: :destroy
  accepts_nested_attributes_for :maintenance_actions
end
