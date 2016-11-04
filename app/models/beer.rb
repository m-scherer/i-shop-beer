class Beer < ActiveRecord::Base
  belongs_to :style
  has_many :beer_orders
  has_many :orders, through: :beer_orders

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  enum status: { instock: 0 , out_of_stock: 1 }

  def get_beer_order(order)
    beer_orders.find_by(order: order).quantity
  end

end
