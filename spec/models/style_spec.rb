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
end
