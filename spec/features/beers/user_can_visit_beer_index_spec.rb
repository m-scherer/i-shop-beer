require 'rails_helper'

describe Beer do
  context "user experience on beer index page" do
    scenario "a user can see beers displayed on the beer index page" do
        style = Style.new(name: "IPA")
        beer = Beer.create(name: "Pliny the Elder", style: style, price: 7.00 )

        visit style_beers_path(style, beer)
        save_and_open_page
        expect(beer).to have_content("Pliny the Elder")
    end
  end
end
