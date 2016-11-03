require 'rails_helper'

describe  'As a logged in user' do
  context 'when I add items to my cart' do
    it "I can place an order" do
      style = Style.create(name: "IPA")
      beer = Beer.create(name: "Pallet Jack", style: style, price: 5.00)
      user = User.create(email: "brad@yahoo.com", password: "pass")
      cart = [beer]

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      allow_any_instance_of(ApplicationController).to receive(:cart_beers).and_return(cart)

      visit cart_path
      click_on "Place Order"
      save_and_open_page

      # expect(current_path).to eq(user_order_path(user, Order.all.last))
      expect(page).to have_content(beer.name)
      expect(page).to have_content(beer.price)
    end
  end
end
