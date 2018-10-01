class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :password, presence: true 
  validates :username, :email, presence: true, uniqueness: true 

  # relationships here
end
