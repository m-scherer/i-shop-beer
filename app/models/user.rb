class User < ActiveRecord::Base
  has_many :orders

  has_secure_password
  
  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true
end
