user1 = User.new(
  email: 'user1@test.com',
  name: 'usertest',
  password: 'usertest',
  password_confirmation: 'usertest',
  created_at: DateTime.now
)
user1.skip_confirmation!
user1.save!

user2 = User.new(
  email: 'user2@test.com',
  name: 'usertest',
  password: 'usertest',
  password_confirmation: 'usertest',
  created_at: DateTime.now
)
user2.skip_confirmation!
user2.save!

10.times do
  listing = Listing.create(
    host: user1,
    title: Faker::Lorem.words.join(" "),
    about: Faker::Lorem.paragraphs.join("\n"),
    max_guests: (1...15).to_a.sample,
    address_line1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: 'US',
    lat: Faker::Address.latitude,
    lng: Faker::Address.longitude,
    status: [:draft, :published].sample,
    nightly_price: 12000,
    cleaning_fee: 5000,
  )
end

10.times do
  listing = Listing.create(
    host: user2,
    title: Faker::Lorem.words.join(" "),
    about: Faker::Lorem.paragraphs.join("\n"),
    max_guests: (1...15).to_a.sample,
    address_line1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: 'US',
    lat: Faker::Address.latitude,
    lng: Faker::Address.longitude,
    status: [:draft, :published].sample,
    nightly_price: 12000,
    cleaning_fee: 5000,
  )
end
