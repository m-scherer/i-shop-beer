require 'rails_helper'

describe  'Can log in as admin' do
  context 'when I go to the login page' do
    it "takes me to admin page if user is an admin" do

      user = User.create(email: "dj@dj.com", password: "password", role: 1)

      visit "/login"
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      within(".form-horizontal") do
        click_on "Login"
      end

      expect(page).to have_content("Admin Dashboard")
    end
  end
end
