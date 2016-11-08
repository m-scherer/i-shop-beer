require 'rails_helper'

describe 'As a logged in admin' do
  context 'when admin goes to admin dashboard page' do
    it "shows list of orders" do

      admin = User.create(email: "dj@dj.com", password: "password", role: 1)
      user = User.create(email: "brad@brad.com", password: "pass", first_name: "Brad",
      last_name: "Green", address: "1510 Blake St")

      style = Style.create(name: "IPA")
      style2 = Style.create(name: "Stout")
      beer = Beer.create(price: 5.00, name: "Pliny the Elder", style: style)
      beer2 = Beer.create(price: 10.00, name: "Guiness", style: style2)

      order = Order.create(user: user)
      order2 = Order.create(user: user)

      BeerOrder.create(beer: beer, order: order, quantity: 1)
      BeerOrder.create(beer: beer2, order: order2, quantity: 1)

      visit "/login"
      fill_in "email", with: admin.email
      fill_in "password", with: admin.password
      within(".form-horizontal") do
        click_on "Login"
      end

      visit admin_dashboard_path(admin)
      expect(page).to have_link("#{order.id}")
      expect(page).to have_link("#{order2.id}")

    end
  end
  context 'when admin goes to a users order page and clicks on an order' do
    it "shows order information" do

      admin = User.create(email: "dj@dj.com", password: "password", role: 1)
      user = User.create(email: "brad@brad.com", password: "pass", first_name: "Brad",
      last_name: "Green", address: "1510 Blake St")

      style = Style.create(name: "IPA")
      style2 = Style.create(name: "Stout")
      beer = Beer.create(price: 5.00, name: "Pliny the Elder", style: style)
      beer2 = Beer.create(price: 10.00, name: "Guiness", style: style2)

      order = Order.create(user: user)
      order2 = Order.create(user: user)

      BeerOrder.create(beer: beer, order: order, quantity: 1)
      BeerOrder.create(beer: beer2, order: order2, quantity: 1)

      visit "/login"
      fill_in "email", with: admin.email
      fill_in "password", with: admin.password
      within(".form-horizontal") do
        click_on "Login"
      end

      visit user_order_path(order.user.id, order.id)
      expect(page).to have_content("Pliny the Elder")
      expect(page).to have_content("5.00")
      expect(page).to have_content("IPA")
    end
  end
end
