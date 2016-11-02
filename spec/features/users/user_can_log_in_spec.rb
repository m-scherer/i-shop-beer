require 'rails_helper'

describe "user visits root" do
  scenario "they can log in" do
    user = User.create(email: "brad@yahoo.com", password: "pass")

    visit '/'
    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    expect(current_path).to eq(beers_path)
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("brad@yahoo.com")
    expect(page).to have_content("Logout")
  end
end
