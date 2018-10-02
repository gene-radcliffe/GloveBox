class Vehicle < ApplicationRecord

  # has_many :maintenance_logs, dependent: :destroy
  belongs_to :user

end
