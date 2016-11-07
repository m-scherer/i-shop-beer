require 'rails_helper'

describe "user experience on styles index page" do
  scenario "a user can see styles displayed on the styles index page" do
      style = Style.create(name: "IPA")
      style_1 = Style.create(name: "Lager")
      style_2 = Style.create(name: "Stout")

      visit styles_path

      expect(page).to have_content(style.name)
      expect(page).to have_content(style_1.name)
      expect(page).to have_content(style_2.name)
  end

  scenario "a user can visit a style page" do
    style = Style.create(name: "IPA")
    style_1 = Style.create(name: "Lager")
    beer = Beer.create(name: "Pliny the Elder", style: style, price: 7.00 )
    beer_2 = Beer.create(name: "Maximus", style: style, price: 6.00 )
    beer_3 = Beer.create(name: "PBR", style: style_1, price: 4.00 )
    beer_4 = Beer.create(name: "Coors", style: style_1, price: 3.00 )

    visit styles_path

    within('#style-index') do
      click_on("IPA")
    end

    expect(page).to have_content(beer.name)
    expect(page).to have_content(beer_2.name)
  end

  scenario "a user can visit another style show page" do
    style = Style.create(name: "IPA")
    style_1 = Style.create(name: "Lager")
    beer = Beer.create(name: "Pliny the Elder", style: style, price: 7.00 )
    beer_2 = Beer.create(name: "Maximus", style: style, price: 6.00 )
    beer_3 = Beer.create(name: "PBR", style: style_1, price: 4.00 )
    beer_4 = Beer.create(name: "Coors", style: style_1, price: 3.00 )

    visit styles_path
    within('#style-index') do
      click_on("Lager")
    end

    expect(page).to have_content(beer_3.name)
    expect(page).to have_content(beer_4.name)
  end
end

describe "a user receives is re-routed when they enter an invalid URL path" do
  scenario "path includes non-existent style" do

    visit("/foo")

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
