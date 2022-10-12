10.times do
  listing = Listing.create(
    title: Faker::Lorem.words.join(" "),
    about: Faker::Lorem.paragraphs.join("\n"),
    max_guests: Faker::Number.number(digits: 20),
    address_line1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    lat: Faker::Address.latitude,
    lng: Faker::Address.longitude,
    status: [:draft, :published].sample,
    nightly_price: Faker::Number.decimal(l_digits: 4, r_digits: 2),
    cleaning_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  )
end

  10.times do
    listing = Listing.create(
      title: Faker::Lorem.words.join(" "),
      about: Faker::Lorem.paragraphs.join("\n"),
      max_guests: Faker::Number.number(digits: 20),
      address_line1: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: Faker::Address.country,
      lat: Faker::Address.latitude,
      lng: Faker::Address.longitude,
      status: [:draft, :published].sample,
      nightly_price: Faker::Number.decimal(l_digits: 4, r_digits: 2),
      cleaning_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    )
  end
