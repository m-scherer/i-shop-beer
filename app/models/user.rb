class User < ActiveRecord::Base
  has_many :orders

  has_secure_password

  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true
  enum role: [:default, :admin]

  def user_orders
    orders.order(id: :desc)
  end
end
