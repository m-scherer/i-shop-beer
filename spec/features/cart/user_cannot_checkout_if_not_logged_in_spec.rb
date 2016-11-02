require 'rails_helper'

describe "Guest user" do
  context "when a user is not logged in" do
    scenario "they can create an account" do
      visit cart_path

      expect(page).to have_link("Create Account")
    end

    scenario "they can log in" do
      visit cart_path

      expect(page).to have_link("Log In")
    end

    scenario "they cannot checkout cart" do
      visit cart_path

      expect(page).to_not have_content("Checkout")
    end

    scenario "can add item to cart" do
      style = Style.create(name: "IPA")
      beer = Beer.create(name: "Pallet Jack", style: style, price: 5.00)

      visit beers_path
      click_button("Add to Cart")

      visit cart_path

      expect(page).to have_content("Pallet Jack")
    end
  end
end
