class Vehicle < ApplicationRecord

  belongs_to :user
  has_many :maintenance_logs
  has_one_attached :avatar
  #has_one_attached :registration
end
