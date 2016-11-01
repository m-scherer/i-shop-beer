require 'rails_helper'

describe "user experience on styles index page" do
  scenario "a user can see styles displayed on the styles index page" do
      style = Style.create(name: "IPA")
      style_1 = Style.create(name: "Lager")
      style_2 = Style.create(name: "Stout")

      visit styles_path
      save_and_open_page

      expect(page).to have_content(style.name)
      expect(page).to have_content(style_1.name)
      expect(page).to have_content(style_2.name)
  end
end
