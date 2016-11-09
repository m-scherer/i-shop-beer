BeerOrder.destroy_all
Order.destroy_all
Beer.destroy_all
Style.destroy_all

IPABEERS = ["Pallet Jack", "Total Domination", "Lunch Break", "Dankosaurus", "Pliny the Elder", "Sticky Hands", "RPM"]
LAGERBEERS = ["Joe's Premium American Pilsner", "Mama's Little Yella Pils", "Lager of the Lakes", "Polestar Pilsner", "Nomad", "Scrimshaw", "Prima Pils"]
STOUTBEERS = ["Monk's Stout", "The Abyss", "Kalamazoo Stout", "Hunahpu's Imperial Stout", "Obsidian Stout", "Bourbon County Stout", "Ivan the Terrible"]
SAISONBEERS = ["Ann", "Peche 'n Brett", "Saison-Brett", "Love Buzz Saison", "Prairie Hop", "HandFarm", "East Bank"]
PORTERBEERS = ["Victory at Sea Coffee Vanilla Imperial Porter", "Black Butte Porter", "Vanilla Porter", "Sierra Nevada", "SmuttyNose Robust Porter", "Sweet Baby Jesus", "King Titus"]
AMBERBEERS = ["Fat Tire Amber Ale", "Bell's Amber Ale", "Avalanche Ale", "Censored", "Tongue Buckler - Imperial Red Ale", "Blood of the Unicorn", "Runoff Red IPA", "Toaster Pastry"]

PRICES = ["4.99", "6.00", "7.11", "2.75", "4.50", "6.33", "7.25", "8.88", "9.13", "5.55"]

ipa = Style.create!(name: "IPA")
lager = Style.create!(name: "Lager")
stout = Style.create!(name: "Stout")
saison = Style.create!(name: "saison")
porter = Style.create!(name: "Porter")
amber = Style.create!(name: "Amber")


IPABEERS.each do |beer|
  Beer.create!(
            name: beer,
            style: ipa,
            price: PRICES.sample,
            description: "Hoppy and dank with a touch of citrus"
              )
end

LAGERBEERS.each do |beer|
  Beer.create!(
            name: beer,
            style: lager,
            price: PRICES.sample,
            description: "Crisp and smooth"
              )
end

STOUTBEERS.each do |beer|
  Beer.create!(
            name: beer,
            style: stout,
            price: PRICES.sample,
            description: "Notes of coffee and chocolate. Rich and smooth"
              )
end

SAISONBEERS.each do |beer|
  Beer.create!(
            name: beer,
            style: saison,
            price: PRICES.sample,
            description: "Spicy and funky"
              )
end

PORTERBEERS.each do |beer|
  Beer.create!(
            name: beer,
            style: porter,
            price: PRICES.sample,
            description: "Vanilla hints, not as heavy as a stout"
              )
end

AMBERBEERS.each do |beer|
  Beer.create!(
            name: beer,
            style: amber,
            price: PRICES.sample,
            description: "Malty and balanced"
              )
end

User.create(email: "admin@admin.com", password: "test", role: 1, first_name: "admin", last_name: "admin", address: "1234 Street")
