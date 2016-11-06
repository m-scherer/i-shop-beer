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

  context "#search" do
    it "can find a beer with the full name" do
      style = Style.create(name: "IPA")
      beer = Beer.create(name: "Pliny the Elder", price: 7.00, style: style)

      expect(Beer.search("Pliny the Elder")).to eq([beer])
    end
    it "can find beers with a portion of the name" do
      style = Style.create(name: "IPA")
      beer1 = Beer.create(name: "Pliny the Elder", price: 7.00, style: style)
      beer2 = Beer.create(name: "Blind Pig I.P.A.", price: 7.00, style: style)

      expect(Beer.search("lin")).to eq([beer1, beer2])
    end
  end

  context "#get_beer_order" do
    it "can get beer orders" do
      style = Style.create(name: "IPA")
      user = User.create(email: "brad@yahoo.com", password: "pass")
      beer = Beer.create(name: "Pliny the Elder", price: 7.00, style: style)
      order = Order.create(user: user)
      beer_order = BeerOrder.create(beer: beer, order: order, quantity: 1)

      expect(beer.get_beer_order(order)).to eq(1)
    end
  end

  context "#get_beer_subtotal" do
    it "can get the subtotal for a beer" do
      style = Style.create(name: "IPA")
      beer = Beer.create(name: "Pliny the Elder", price: 7.00, style: style)
      user = User.create(email: "brad@yahoo.com", password: "pass")
      order = Order.create(user: user)
      beer_order = BeerOrder.create(beer: beer, order: order, quantity: 2)

      expect(beer.get_subtotal(order)).to eq(14.00)
    end
  end

end
