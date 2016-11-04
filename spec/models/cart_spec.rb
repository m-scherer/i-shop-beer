require 'rails_helper'

describe Cart do
  before(:each) do
    @session_cart = {"1"=>2}
    @cart = Cart.new(@session_cart)
  end

  it "has initial contents" do
    expect(@cart.contents).to eq(@session_cart)
  end

  describe "#add_beer" do
    it "can add beer" do
      @cart.add_beer(1)
      @cart.add_beer(2)

      expect(@cart.contents).to eq({"1"=>3, "2"=>1})
    end
  end
  describe "#total" do
    it "totals the number of beers in the cart" do
      @cart.add_beer(2)

      expect(@cart.total).to eq(3)
    end
  end
  describe "#count_of" do
    it "can count the number of a specific beer" do
      @cart.add_beer(2)
      @cart.add_beer(2)

      expect(@cart.count_of(2)).to eq(2)
    end
  end

  describe "#get_quantity_of_beer" do
    it "can get the quantity beer" do
      cart = Cart.new({"1" => 5, "2" => 1})
      user = User.create(email: "brad@yahoo.com", password: "pass")
      style = Style.create(name: "IPA")
      beer = Beer.create(name: "Pallet Jack", style: style, price: 5.00)
      order = Order.new(user: user)

      expect(order.create_beer_orders([beer], cart)).to eq([beer])
    end
  end

end
