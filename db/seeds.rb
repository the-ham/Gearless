# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

User.destroy_all #syntax for destroy all

# Admin acc
User.create!(first_name: "Admin", last_name: "Admin", email: "admin@gmail.com", phone_number: 123456, description: "Admin account", password: "password")

10.times do
  x = User.create!(password: "password",
                   first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   email: Faker::Internet.email,
                   phone_number: Faker::PhoneNumber.phone_number,
                   description: Faker::Lorem.sentence)
  y = Gear.create!(user_id: x.id,
                   gear_type: ["Tent", "Cookery", "Hiking gear", "Survival gear"].sample,
                   summary: Faker::Mountain.name,
                   address: Faker::Address.street_address,
                   price: rand(10.0...200.0))
  Rental.create!(price: y.price,
                 total: y.price * 3,
                 start_date: Faker::Date.between(from: Date.today + 1, to: 3.days.from_now),
                 end_date: Faker::Date.between(from: 4.days.from_now, to: 20.days.from_now),
                 status: [true, false].sample,
                 user_id: x.id,
                 gear_id: y.id)
end
