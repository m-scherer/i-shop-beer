class Beer < ActiveRecord::Base
  belongs_to :style
  has_many :beer_orders
  has_many :orders, through: :beer_orders

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :style, presence: true

  def self.search(argument)
    if argument
      where("name LIKE ?", "%#{argument}%")
    else
      Beer.all
    end
  end

  enum status: { instock: 0 , out_of_stock: 1 }

  def get_beer_order(order)
    beer_orders.find_by(order: order).quantity
  end

  def get_subtotal(order)
    price * get_beer_order(order)
  end

end
