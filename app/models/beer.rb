class Beer < ActiveRecord::Base
  belongs_to :style
  has_many :beer_orders
  has_many :orders, through: :beer_orders
  
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
