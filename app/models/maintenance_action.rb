class MaintenanceAction < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :maintenance_log, dependent: :destroy

  TYPES=[
    "OilChange",
    "Brake",
    "Rotor",
    "TireRotation",
    "TireReplacement",
    "Alignment",
    "PowerSteeringFluid",
    "Antifreeze",
    "TransmissionFluid",
    "BrakeFluid",
    "Miscellaneous"
  ]


end
