require 'rails_helper'

describe 'admin visits admin dashboard' do
  scenario 'admin can change own data' do
    user = User.create(email: "zuma@zuma.com", password: "zuma", role: "admin")

    visit "/login"

    fill_in "email", with: user.email
    fill_in "password", with: user.password
    within(".form-horizontal") do
      click_on "Login"
    end

    click_on "Edit Admin User Info"

    fill_in "Email", with: "santa@santa.com"
    fill_in "Password", with: "santa"
    fill_in "Retype password", with: "santa"

    click_on "Update Account"

    save_and_open_page

    expect(page).to have_content("santa@santa.com")
  end

end
