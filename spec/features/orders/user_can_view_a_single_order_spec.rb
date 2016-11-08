require 'rails_helper'

describe  "As a logged in user" do
  context "when I place an order" do
    it "I can view an order" do
      style = Style.create(name: "IPA")
      beer = Beer.create(name: "Pallet Jack", style: style, price: 5.00)
      user = User.create(email: "brad@yahoo.com", password: "pass")
      order = Order.create(user: user)
      BeerOrder.create(beer: beer, order: order, quantity: 1)


      visit '/login'
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      within(".form-horizontal") do
        click_on "Login"
      end

      visit user_order_path(user, order)

      expect(page).to have_content("Pallet Jack")
      expect(page).to have_content("Price: $5.00")
      expect(page).to have_content("Subtotal: $5.00")
      expect(page).to have_content("Order Date: #{order.created_at}")
      expect(page).to have_content("Order Total: $5.00")
    end
    it "shows completed order status and date" do
      style = Style.create(name: "IPA")
      beer = Beer.create(name: "Pallet Jack", style: style, price: 5.00)
      user = User.create(email: "brad@yahoo.com", password: "pass")
      order = Order.create(user: user)
      BeerOrder.create(beer: beer, order: order, quantity: 1)


      visit '/login'
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      within(".form-horizontal") do
        click_on "Login"
      end

      order.Completed!

      visit user_order_path(user, order)

      expect(page).to have_content("Order Status: Completed")
      expect(page).to have_content("Last Updated: #{order.updated_at}")
    end
    it "shows completed order status and date" do
      style = Style.create(name: "IPA")
      beer = Beer.create(name: "Pallet Jack", style: style, price: 5.00)
      user = User.create(email: "brad@yahoo.com", password: "pass")
      order = Order.create(user: user)
      BeerOrder.create(beer: beer, order: order, quantity: 1)

      visit '/login'
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      within(".form-horizontal") do
        click_on "Login"
      end

      order.Cancelled!

      visit user_order_path(user, order)

      expect(page).to have_content("Order Status: Cancelled")
      expect(page).to have_content("Last Updated: #{order.updated_at}")
    end
    it "doesn't show timestamp when not completed or cancelled" do
      style = Style.create(name: "IPA")
      beer = Beer.create(name: "Pallet Jack", style: style, price: 5.00)
      user = User.create(email: "brad@yahoo.com", password: "pass")
      order = Order.create(user: user)
      BeerOrder.create(beer: beer, order: order, quantity: 1)


      visit '/login'
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      within(".form-horizontal") do
        click_on "Login"
      end

      visit user_order_path(user, order)

      expect(page).to_not have_content("Last Updated: ")
    end

  end
end
