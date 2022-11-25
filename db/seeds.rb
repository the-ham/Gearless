require "faker"
require "open-uri"

User.destroy_all #syntax for destroy all

# Admin acc
User.create!(first_name: "Admin", last_name: "Admin", email: "admin@gmail.com", phone_number: 123456, description: "Admin account", password: "password")

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")

# 10.times do
#   x = User.create!(password: "password",
#                    first_name: Faker::Name.first_name,
#                    last_name: Faker::Name.last_name,
#                    email: Faker::Internet.email,
#                    phone_number: Faker::PhoneNumber.phone_number,
#                    description: Faker::Lorem.sentence)

#   y = Gear.create!(user_id: x.id,
#                    gear_type: %w(Hiking Rock-Climbing Cooking Sleeping Kayak Navigation Shelter Sleeping-Bags Hydration Navigation First-Aid Survival Illumination Repair-Kits).sample,
#                    gear_name: Faker::Vehicle.drive_type,
#                    summary: "Lorem Ipsum",
#                    address: Faker::Address.street_address,
#                    total_occupancy: rand(1..10),
#                    price: rand(10.0..200.0).round)
#   file = URI.open("https://source.unsplash.com/random?outdoor-gear")
#   y.photos.attach(io: file, filename: "tent.png", content_type: "image/jpg")
#   y.save
#   Rental.create!(price: y.price,
#                  total: y.price * 3,
#                  start_date: Faker::Date.between(from: Date.today + 1, to: 3.days.from_now),
#                  end_date: Faker::Date.between(from: 4.days.from_now, to: 20.days.from_now),
#                  status: "pending",
#                  user_id: x.id,
#                  gear_id: y.id)
# end

# id: 1
User.create!(password: "password",
            first_name: "Christian",
            last_name: "Grey",
            location: "Vancouver",
            email: "chris@fiftyshades.org",
            phone_number: Faker::PhoneNumber.phone_number,
            description: "Are you going camping with my gear or will I have to rope you into it?")
# id: 2
User.create!(password: "password",
            first_name: "Ron",
            last_name: "Weasley",
            location: "The Burrow"
            email: "weasley@hogwarts.edu.au",
            phone_number: Faker::PhoneNumber.phone_number,
            description: "Love going camping to get away from the chaos at home. My gear is seven generations old but trust me, it will never fail you. Full refunds processed regularly.")
# id: 3
User.create!(password: "password",
            first_name: "Edward",
            last_name: "Cullen",
            location: "Pheonix",
            email: "edcullen@vampires.com",
            phone_number: Faker::PhoneNumber.phone_number,
            description: "Big outdoorsman with lots of gear to rent. Hit me up if you're a human and we can chat.")
# id: 4
User.create!(password: "password",
              first_name: "Asa",
              last_name: "Akira",
              location: "Pheonix",
              email: "asaakira@phub.com",
              phone_number: Faker::PhoneNumber.phone_number,
              description: "All gear comes sterilized and cleaned. Cheeky gift with every rental over $100.")


a = Gear.create!(user_id: 1,
            gear_type: "Hiking",
            gear_name: "Black Diamond Alpine FLZ 140cm Trekking Poles",
            summary: "Premium hiking poles to provide supprt for maximum performance. Used once on the Three Capes Track, super durable and they even pack down for easy transport and storage.",
            address: Faker::Address.street_address,
            total_occupancy: 1,
            price: 75)
            file = URI.open("https://www.bcf.com.au/dw/image/v2/BBRV_PRD/on/demandware.static/-/Sites-srg-internal-master-catalog/default/dw3b26ef61/images/634395/BCF_634395-00_hi-res.jpg?sw=1000&sh=1000&sm=fit&q=80")
            a.photos.attach(io: file, filename: "hiking_poles.png", content_type: "image/jpg")
            a.save
b = Gear.create!(user_id: 1,
                gear_type: "Sleeping",
                gear_name: "Wanderer Scorch Duo Hooded Sleeping Bag",
                summary: "Get snug with the person you love on a cold night in the bush. It's a double sleeping bag made with a temperature rating of 0°C to keep it toasty warm in cold weather. You can also unzip it and use it as a single sleeping bag, for a +5°C comfort rating.",
                address: Faker::Address.street_address,
                total_occupancy: 2,
                price: 95)
                file = URI.open("https://www.bcf.com.au/dw/image/v2/BBRV_PRD/on/demandware.static/-/Sites-srg-internal-master-catalog/default/dwcd5aa6a4/images/521038/BCF_521038_hi-res.jpg?sw=1000&sh=1000&sm=fit&q=80")
                b.photos.attach(io: file, filename: "sleeping_bag.png", content_type: "image/jpg")
                b.save
c = Gear.create!(user_id: 2,
                gear_type: "Cooking",
                gear_name: "Campmaster Butane Hiking Stove",
                summary: "Bring out you inner Jamie Oliver with this versatile stove. Featuring an independent and foldable pot holder, which is suitable for various cookers.",
                address: Faker::Address.street_address,
                total_occupancy: 10,
                price: 20)
                file = URI.open("https://www.bcf.com.au/dw/image/v2/BBRV_PRD/on/demandware.static/-/Sites-srg-internal-master-catalog/default/dwc721d9c6/images/589692/BCF_589692-00_hi-res.jpg?sw=1000&sh=1000&sm=fit&q=80")
                c.photos.attach(io: file, filename: "stove.png", content_type: "image/jpg")
                c.save

d = Gear.create!(user_id: 3,
                gear_type: "Illumination",
                gear_name: "Ledlenser P7R Signature Torch",
                summary: "This is one of Ledlener's most premium, high-quality lights with up to 2000 lumens brightness. Battery has been recently replaced and is in ful working condition. ",
                address: Faker::Address.street_address,
                total_occupancy: 5,
                price: 40)
                file = URI.open("https://www.bcf.com.au/dw/image/v2/BBRV_PRD/on/demandware.static/-/Sites-srg-internal-master-catalog/default/dw30b040f9/images/603304/BCF_603304-04_hi-res.jpg?sw=1000&sh=1000&sm=fit&q=80")
                d.photos.attach(io: file, filename: "torch.png", content_type: "image/jpg")
                d.save

e = Gear.create!(user_id: 4,
                  gear_type: "Shelter",
                  gear_name: "Coleman Swagger Instant Tent 3 Person",
                  summary: "This 3 person tent uses an instant design that makes it quick and easy to set up. It’s tough and durable, with a strong frame design, and spring-loaded fiberglass poles for more head room. Perfect for your next trip out.",
                  address: Faker::Address.street_address,
                  total_occupancy: 3,
                  price: 60)
                  file = URI.open("https://www.bcf.com.au/dw/image/v2/BBRV_PRD/on/demandware.static/-/Sites-srg-internal-master-catalog/default/dw4ee965cd/images/599188/BCF_599188_hi-res.jpg?sw=1000&sh=1000&sm=fit&q=80")
                  e.photos.attach(io: file, filename: "tent.png", content_type: "image/jpg")
                  e.save
f = Gear.create!(user_id: 4,
                  gear_type: "Navigation",
                  gear_name: "Oricom UHF390PK Radio Value Pack",
                  summary: "The integrated speaker in the mike gives you great volume and sound quality by working with the transceiver speaker. Slightly unreliable and you will get lost, but at least you get a good deal.",
                  address: Faker::Address.street_address,
                  total_occupancy: 3,
                  price: 10)
                  file = URI.open("https://www.bcf.com.au/dw/image/v2/BBRV_PRD/on/demandware.static/-/Sites-srg-internal-master-catalog/default/dw22d3188c/images/599077/BCF_599077_hi-res.jpg?sw=1000&sh=1000&sm=fit&q=80")
                  f.photos.attach(io: file, filename: "radio.png", content_type: "image/jpg")
                  f.save
g = Gear.create!(user_id: 4,
                gear_type: "Kayak",
                gear_name: "Pryml Raven Fishing Kayak",
                summary: "If you love to fish Australia's calm tidal estuaries or freshwater streams then an inflatable kayak is the way to do it. The Pryml Raven Fishing Kayak will have you feasting on fish and chips in no time!",
                address: Faker::Address.street_address,
                total_occupancy: 4,
                price: 100)
                file = URI.open("https://www.bcf.com.au/dw/image/v2/BBRV_PRD/on/demandware.static/-/Sites-srg-internal-master-catalog/default/dw7717caa9/images/634060/BCF_634060_hi-res.jpg?sw=1000&sh=1000&sm=fit&q=80")
                f.photos.attach(io: file, filename: "kayak.png", content_type: "image/jpg")
                f.save
