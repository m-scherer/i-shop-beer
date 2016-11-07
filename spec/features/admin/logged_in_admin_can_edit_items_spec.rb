require 'rails_helper'

describe "as a logged in admin" do
  context "admin can visit /beers page" do
    it "can see an index of beers" do
      admin = User.create(email: "nick@nick.com", password: "password", role: 1)
      style = Style.new(name: "IPA")
      beer = Beer.create(name: "Pliny the Elder", style: style, price: 7.00, description: "Tasty beer", image: "http://www.bravosolutions.com/img13/beer.gif" )
      beer_1 = Beer.create(name: "Pliny the Elder", style: style, price: 7.00, description: "Tasty beer", image: "http://www.bravosolutions.com/img13/beer.gif" )
      beer_2 = Beer.create(name: "PBR", style: style, price: 7.00, description: "Tasty beer", image: "http://www.bravosolutions.com/img13/beer.gif" )

      visit "/login"
      fill_in "email", with: admin.email
      fill_in "password", with: admin.password
      within(".form-horizontal") do
        click_on "Login"
      end

      visit '/admin/beers'
      expect(page).to have_content("PBR")

    end

    it "can edit a beer" do
      admin = User.create(email: "nick@nick.com", password: "password", role: 1)
      style = Style.new(name: "IPA")
      beer = Beer.create(name: "Pliny the Elder", style: style, price: 7.00, description: "Tasty beer", image: "http://www.bravosolutions.com/img13/beer.gif" )

      visit "/login"
      fill_in "email", with: admin.email
      fill_in "password", with: admin.password
      within(".form-horizontal") do
        click_on "Login"
      end

      visit '/admin/beers'
      first(:link, "Edit").click
      fill_in "Name", with: "XYZ"
      click_button("Update Beer")

      expect(page).to have_content("XYZ")
    end
  end
end
