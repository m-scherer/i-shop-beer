require 'rails_helper'

describe  'As a logged in admin' do
  context 'when I go to a users order page' do
    it "shows user and item info" do

      style = Style.create(name: "IPA")
      beer = Beer.create(price: 5.00, name: "Pliny the Elder", style: style)
      admin = User.create(email: "dj@dj.com", password: "password", role: 1)
      user = User.create(email: "brad@brad.com", password: "pass", first_name: "Brad",
                         last_name: "Green", address: "1510 Blake St")
      order = Order.create(user: user)
      BeerOrder.create(beer: beer, order: order, quantity: 2)

      visit "/login"
      fill_in "email", with: admin.email
      fill_in "password", with: admin.password
      within(".form-horizontal") do
        click_on "Login"
      end

      visit user_order_path(user, order)
      save_and_open_page

      expect(page).to have_content("Order Date: #{order.created_at}")
      expect(page).to have_content("Brad")
      expect(page).to have_content("Green")
      expect(page).to have_content("1510 Blake St")
      expect(page).to have_link("Pliny the Elder")

      within(".table") do
      expect(page).to have_content("$5.00")
      expect(page).to have_content("$10.00")
      end

      expect(page).to have_content("Order Total: $10.00")
      expect(page).to have_content("Order Status: Ordered")

    end
  end
end
