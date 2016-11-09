require 'rails_helper'

describe "Guest user" do
  context "when a user is not logged in" do
    it "can log in and see cart data" do

      style = Style.create(name: "IPA")
      beer = Beer.create(name: "Pallet Jack", style: style, price: 5.00)
      user = User.create(email: "brad@yahoo.com", password: "pass")

      visit beers_path
      click_button("Add to Cart")

      visit login_path
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      within(".form-horizontal") do
        click_on "Login"
      end

      visit cart_path

      expect(page).to have_content("Pallet Jack")
      expect(page).to have_button("Checkout")
    end

    it "can create an account and see cart data" do

      style = Style.create(name: "IPA")
      beer = Beer.create(name: "Pallet Jack", style: style, price: 5.00)
      user = User.new(email: "brad@yahoo.com", password: "pass")

      visit beers_path
      click_button("Add to Cart")

      visit new_user_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      fill_in "user[password_confirmation]", with: user.password
      within(".form-horizontal") do
        click_on "Create Account"
      end


      visit cart_path
      expect(page).to have_content("Pallet Jack")
    end

    it "does not see log in or create account on cart page" do

      user = User.create(email: "brad@yahoo.com", password: "pass")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit cart_path
      expect(page).to_not have_content("Log In")
      expect(page).to_not have_content("Create Account")
    end
  end
end
