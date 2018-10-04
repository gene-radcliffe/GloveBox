class Vehicle < ApplicationRecord

  belongs_to :user, dependent: :destroy
  has_many :maintenance_logs

end
