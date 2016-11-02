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
    click_button "Add to Cart"

    # within(:css, "#cart") do
      click_link('cart')
    # end
    save_and_open_page


  end
end
