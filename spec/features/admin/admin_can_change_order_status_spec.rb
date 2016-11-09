require 'rails_helper'

describe 'As a logged in admin' do
  before(:each) do
    admin = User.create(email: "dj@dj.com", password: "password", role: 1)
    user = User.create(email: "brad@brad.com", password: "pass", first_name: "Brad",
    last_name: "Green", address: "1510 Blake St")

    style = Style.create(name: "IPA")
    style2 = Style.create(name: "Stout")
    beer = Beer.create(price: 5.00, name: "Pliny the Elder", style: style)
    beer2 = Beer.create(price: 10.00, name: "Guiness", style: style2)

    @order = Order.create(user: user)

    BeerOrder.create(beer: beer, order: order, quantity: 1)

    visit "/login"
    fill_in "email", with: admin.email
    fill_in "password", with: admin.password
    within(".form-horizontal") do
      click_on "Login"
    end
  context 'when admin goes to admin dashboard page' do
    it "can change status from ordered to paid" do

      visit admin_dashboard_path(admin)
      within("#order_status") do
        expect(page).to_not have_content("Paid")
      end

      click_button "Mark As Paid"
      within("#order_status") do
        expect(page).to have_content("Paid")
      end
    end
  end
    context 'when admin goes to admin dashboard page' do
      it "can change status from paid to cancelled" do
        @order.Paid!
        visit admin_dashboard_path(admin)
        within("#order_status") do
          expect(page).to have_content("Paid")
        end

        click_button "Cancel"
        within("#order_status") do
          expect(page).to have_content("Cancelled")
          expect(page).to_not have_content("Paid")

        end
      end
    context 'when admin goes to admin dashboard page' do
      it "can change status from ordered to cancelled" do

        visit admin_dashboard_path(admin)
        within("#order_status") do
          expect(page).to_not have_content("Canced")
        end

        click_button "Cancel"
        within("#order_status") do
          expect(page).to have_content("Cancelled")
        end
      end
    end
    context 'when admin goes to admin dashboard page' do
      it "can change status from paid to completed" do
        @order.Paid!
        visit admin_dashboard_path(admin)
        within("#order_status") do
          expect(page).to_not have_content("Completed")
        end

        click_button "Mark As Paid"
        within("#order_status") do
          expect(page).to_not have_content("Paid")
          expect(page).to have_content("Completed")
        end
      end
    end
  end
  end
end
