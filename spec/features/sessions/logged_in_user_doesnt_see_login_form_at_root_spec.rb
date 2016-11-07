require 'rails_helper'

describe  "As a logged in user" do
  context "when I go to the root" do
    it "I can not see the login form" do
      user = User.create(email: "brad@yahoo.com", password: "pass")
      order = Order.new(user: user)

      visit '/login'
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      within(".form-horizontal") do
        click_on "Login"
      end
      visit '/'

      expect(page).to_not have_content('Password')
    end
  end
end

describe  "As a non-logged in user" do
  context "when I go to the root" do
    it "I can see the login form" do
      user = User.create(email: "brad@yahoo.com", password: "pass")
      order = Order.new(user: user)

      visit '/'

      expect(page).to have_content('Password')
    end
  end
end
