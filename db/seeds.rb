require "faker"
require "open-uri"


User.destroy_all #syntax for destroy all

# Admin acc
User.create!(first_name: "Admin", last_name: "Admin", email: "admin@gmail.com", phone_number: 123456, description: "Admin account", password: "password")

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")

10.times do
  x = User.create!(password: "password",
                   first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   email: Faker::Internet.email,
                   phone_number: Faker::PhoneNumber.phone_number,
                   description: Faker::Lorem.sentence)

  y = Gear.create!(user_id: x.id,
                   gear_type: %w(Hiking Rock-Climbing Cooking Sleeping Kayak Navigation Shelter Sleeping-Bags Hydration Navigation First-Aid Survival Illumination Repair-Kits).sample,
                   gear_name: Faker::Vehicle.drive_type,
                   summary: "Lorem Ipsum",
                   address: Faker::Address.street_address,
                   total_occupancy: rand(1..10),
                   price: rand(10.0..200.0).round)
  file = URI.open("https://source.unsplash.com/random?outdoor-gear")
  y.photos.attach(io: file, filename: "tent.png", content_type: "image/jpg")
  y.save
  Rental.create!(price: y.price,
                 total: y.price * 3,
                 start_date: Faker::Date.between(from: Date.today + 1, to: 3.days.from_now),
                 end_date: Faker::Date.between(from: 4.days.from_now, to: 20.days.from_now),
                 status: "pending",
                 user_id: x.id,
                 gear_id: y.id)
end
