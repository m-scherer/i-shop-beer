require 'rails_helper'

RSpec.describe Beer, type: :model do
  context "validates attributes" do
    scenario "beer invalid without a name" do
      style = Style.new(name: "IPA")
      beer = Beer.new(style: style, price: 3.50)

      expect(beer).to be_invalid
    end

    scenario "beer invalid without a price" do
      style = Style.new(name: "IPA")
      beer = Beer.new(style: style, name: "Pliny the Elder")

      expect(beer).to be_invalid
    end

    scenario "beer invalid without a style" do
      beer = Beer.new(name: "Pliny the Elder", price: 7.00)

      expect(beer).to be_invalid
    end

    scenario "beer valid with all attributes present" do
      style = Style.new(name: "IPA")
      beer = Beer.new(style: style, name: "Pliny the Elder", price: 7.00)

      expect(beer).to be_valid
    end
  end

  context "relationships" do
    it "responds to style" do
      beer = Beer.new

      expect(beer).to respond_to(:style)
      expect(beer).to_not respond_to(:styles)
    end
    it "has many beer_orders" do
      beer = Beer.new

      expect(beer).to respond_to(:beer_orders)
      expect(beer).to_not respond_to(:beer_order)
    end
    it "has many orders" do
      beer = Beer.new

      expect(beer).to respond_to(:orders)
      expect(beer).to_not respond_to(:order)
    end
  end

  context "#get_beer_order" do
    it "can get beer orders" do
      style = Style.create(name: "IPA")
      user = User.create(email: "brad@yahoo.com", password: "pass")
      beer = Beer.create(name: "Pliny the Elder", price: 7.00, style: style)
      order = Order.create(user: user)
      beer_order = BeerOrder.create(beer: beer, order:order, quantity: 1)

      expect(beer.get_beer_order(order)).to eq(1)
    end
  end
end
