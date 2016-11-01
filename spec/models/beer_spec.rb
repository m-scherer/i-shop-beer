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

    scenario "beer valid with all attributes present" do
      style = Style.new(name: "IPA")
      beer = Beer.new(style: style, name: "Pliny the Elder", price: 7.00)

      expect(beer).to be_valid
    end
  end

  context "relationships" do
    it "responds to style" do
      beer = Beer.new(name: "Pliny the Elder", price: 7.00)

      expect(beer).to respond_to(:style)
      expect(beer).to_not respond_to(:styles)
    end
  end
end
