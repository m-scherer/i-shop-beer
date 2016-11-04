require "rails_helper"

RSpec.feature "User adds beers" do
  scenario "displays the flash message and displays the cart count" do
    style = Style.create(
        name: "IPA"
    )
    beer = Beer.create!(
        name: "Lunch Break",
        price: 5.99,
        style: style
    )

    visit style_beers_path(style, beer)

    expect(page).to have_content("0")
    click_button "Add to Cart"

    expect(page).to have_content("#{beer.name} added to cart!")
    expect(page).to have_content("1")
    click_button "Add to Cart"

    expect(page).to have_content("#{beer.name} added to cart!")
    expect(page).to have_content("2")
  end
end
