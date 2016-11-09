require 'rails_helper'

describe 'As a logged in admin' do

  before(:each) do
    @admin = User.create(email: "dj@dj.com", password: "password", role: 1)
    @user = User.create(email: "brad@brad.com", password: "pass", first_name: "Brad",
    last_name: "Green", address: "1510 Blake St")

    @style = Style.create(name: "IPA")
    @style2 = Style.create(name: "Stout")
    @beer = Beer.create(price: 5.00, name: "Pliny the Elder", style: @style)
    @beer2 = Beer.create(price: 10.00, name: "Guiness", style: @style2)

    @order = Order.create(user: @user)
    @order2 = Order.create(user: @user, order_status: 1)

    BeerOrder.create(beer: @beer, order: @order, quantity: 1)
    BeerOrder.create(beer: @beer2, order: @order2, quantity: 1)

    visit "/login"
    fill_in "email", with: @admin.email
    fill_in "password", with: @admin.password
    within(".form-horizontal") do
      click_on "Login"
    end
  end

  context 'when admin goes to admin dashboard page' do
    it "sees all orders" do

      visit admin_dashboard_path(@admin)
      expect(page).to have_link("#{@order.id}")
      expect(page).to have_link("#{@order2.id}")

    end
  end
  context 'when admin goes to admin dashboard page' do
    it "filters orders by ordered status" do

      visit admin_dashboard_path(@admin)
      click_button "Filter By Status"
      click_on "Paid"
      
      expect(page).to have_link("#{@order2.id}")
      expect(page).to_not have_link("#{@order.id}")

      end
    end
  end
