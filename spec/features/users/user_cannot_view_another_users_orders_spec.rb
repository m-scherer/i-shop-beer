require 'rails_helper'

describe "when a user views their orders" do
  context "and they type another user's order id into the url" do
    it "should not be able to view that user's order" do
      user = User.create(email: "brad@yahoo.com", password: "pass", role: 0)
      user_1 = User.create(email: "bill@yahoo.com", password: "pass", role: 0)
      order = Order.create(user: user)
      order_1 = Order.create(user: user_1)

      visit '/login'
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      within(".form-horizontal") do
        click_on "Login"
      end

      visit "/users/#{user.id}/orders/#{order.id}"
      expect(page).to have_content(order.id)

      visit "/users/#{user.id}/orders/#{order_1.id}"
      expect(page).to have_content((404))
    end
  end
end
