BeerOrder.destroy_all
Order.destroy_all
Beer.destroy_all
Style.destroy_all
BEERS = ["PBR", "Spiny the Elder", "Coors", "Heineken", "Avery IPA", "Epic IPA", "Breckenridge Lager", "Dogfish Double IPA"]
STYLES = ["IPA", "Lager", "Stout", "Belgian", "Bock", "Pale Ale"]
PRICES = ["4.99", "6.00", "7.11", "2.75", "4.50", "6.33", "7.25", "8.88", "9.13", "5.55"]
DESCRIPTION = ["Tasty Beer", "Nasty Beer", "Meh Beer"]
IMAGE = ["http://www.bravosolutions.com/img13/beer.gif"]

STYLES.each do |style|
  Style.create!(name: style)
end

BEERS.each do |beer|
    Beer.create!(name:beer, price:PRICES.sample, style:Style.find_by(name: STYLES.sample), image:IMAGE.sample, description:DESCRIPTION.sample, status:0)
end

User.create(email: "admin@admin.com" password: "test" role: 1, first_name: "admin", last_name: "admin", address: "1234 Street")
