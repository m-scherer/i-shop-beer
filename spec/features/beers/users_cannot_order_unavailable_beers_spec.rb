require 'rails_helper'

describe "can a user add an out of stock beer to a cart" do
  context "a beer is out of stock" do
    scenario "a user sees the out of stock image on the beer" do
      style = Style.create(name: "IPA")
      style_1 = Style.create(name: "Lager")
      beer = Beer.create(name: "Pliny the Elder", style: style, price: 7.00, description: 'Good', status: 0 )
      beer_2 = Beer.create(name: "Maximus", style: style, price: 6.00, description: 'Good', status: 0 )
      beer_3 = Beer.create(name: "PBR", style: style_1, price: 4.00, description: 'Good', status: 0 )
      beer_4 = Beer.create(name: "Coors", style: style_1, price: 3.00, description: 'Good', status: 1 )

      visit '/items'

      within("#overlay") do
        expect(page).to have_css("#overlay_image")
      end
    end
  end
end
