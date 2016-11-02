require 'rails_helper'

describe "user visits a new user page" do
  scenario "they can create a new user" do

    visit new_user_path
    fill_in "user[email]", with: "brad@yahoo.com"
    fill_in "user[password]", with: "pass"
    fill_in "user[password_confirmation]", with: "pass"
    click_on "Create Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Account for brad@yahoo.com created")
    within("#login") do
      expect(page).to have_content("brad@yahoo.com")
    end
  end
end
