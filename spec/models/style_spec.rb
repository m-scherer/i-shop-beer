require 'rails_helper'

RSpec.describe Style, type: :model do
  context "validates attributes" do
    scenario "style invalid without name" do
      style = Style.new()

      expect(style).to be_invalid
    end

    scenario "style valid with attributes present" do
      style = Style.new(name: "Stout")

      expect(style).to be_valid
    end
  end

  context "relationships" do
    it "responds to beer" do
      style = Style.new(name: "Porter")

      expect(style).to respond_to(:beers)
      expect(style).to_not respond_to(:beer)
    end
  end
end
