require "rails_helper"

RSpec.feature "User views cart" do
  scenario "user sees multiple items in cart" do

    style = Style.create(
        name: "IPA"
    )
    beer = Beer.create!(
        name: "Lunch Break",
        price: 5.99,
        style: style
    )

    visit style_beers_path(style, beer)

    expect(page).to have_content("(0)")
    click_button('Add to Cart')

    click_link('cart')

    expect(page).to have_content(beer.name)
  end

  context "user's cart is empty if they do not add any beers" do
    scenario "user visit's cart and it is empty" do

      style = Style.create(
          name: "IPA"
      )
      beer = Beer.create!(
          name: "Lunch Break",
          price: 5.99,
          style: style
      )

      visit style_beers_path(style, beer)
      expect(page).to have_content("(0)")
      click_link('cart')
      save_and_open_page

      expect(page).to_not have_content(beer.name)
      expect(page).to have_content("Your cart is empty.")
    end
  end
end
