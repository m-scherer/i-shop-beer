require 'rails_helper'

describe "user visits root" do
  scenario "they can log in" do
    user = User.create(email: "brad@yahoo.com", password: "pass")

    visit '/login'
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    within(".form-horizontal") do
      click_on "Login"
    end

    expect(current_path).to eq(beers_path)
    expect(page).to have_content("Logged in as #{user.email}")
    expect(page).to have_content("brad@yahoo.com")
    expect(page).to have_content("Logout")
  end
  context "they can't log in" do
    it "with a bad email" do
      user = User.new(email: "brad@yahoo.com", password: "pass")

      visit '/login'
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      within(".form-horizontal") do
        click_on "Login"
      end

      expect(current_path).to eq('/login')
      expect(page).to have_content('Please enter a valid email!')
    end
    it "with a bad password" do
      user = User.create(email: "brad@yahoo.com", password: "pass")

      visit '/login'
      fill_in "email", with: user.email
      fill_in "password", with: "poop"
      within(".form-horizontal") do
        click_on "Login"
      end

      expect(current_path).to eq('/login')
      expect(page).to have_content('Password invalid!')
    end
  end
end
