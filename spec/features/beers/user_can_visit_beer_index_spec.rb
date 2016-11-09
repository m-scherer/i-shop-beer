require 'rails_helper'

describe Beer do
  context "user experience on beer index page" do
    scenario "a user can see beers displayed on the beer index page" do
        style = Style.new(name: "IPA")
        beer = Beer.create(name: "Pliny the Elder", style: style, price: 7.00 )

        visit beers_path

        expect(page).to have_content("Pliny the Elder")
    end
  end

  context "user experience on beer show page" do
    scenario "a user can view beer show page from beer index" do
      style = Style.new(name: "IPA")
      beer = Beer.create(name: "Pliny the Elder", style: style, price: 7.00, description: "Tasty beer")

      visit beers_path
      click_on(beer.name)

      expect(page).to have_content(7.00)
    end
  end
end
