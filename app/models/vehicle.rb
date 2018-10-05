class Vehicle < ApplicationRecord

  belongs_to :user, dependent: :destroy
  has_many :maintenance_logs
  has_one_attached :avatar
  
end
