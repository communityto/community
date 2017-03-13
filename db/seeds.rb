# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Cafe")
Category.create(name: "Bar")
Category.create(name: "Restaurant")
Category.create(name: "Retail")
Category.create(name: "Office")
Category.create(name: "Residential")

Category.create(name: "Art")
Category.create(name: "Event")
Category.create(name: "Meeting")


Amenity.create(name: "Pets Allowed")
Amenity.create(name: "Internet")
Amenity.create(name: "Onsite Parking")
Amenity.create(name: "Wireless Internet")
Amenity.create(name: "Air Conditioning")
Amenity.create(name: "Elevator")
Amenity.create(name: "Wheelchair Accessibility")
Amenity.create(name: "Coat Check")
Amenity.create(name: "Kid Friendly")
Amenity.create(name: "Kitchen")
Amenity.create(name: "Television")
Amenity.create(name: "Projection Screen")
Amenity.create(name: "Speakers")
Amenity.create(name: "Rooftop")
Amenity.create(name: "Outdoor Space")
Amenity.create(name: "Tables")
Amenity.create(name: "Seating")
Amenity.create(name: "Storage")

5.times do
  User.create!(
    first_name: Faker::Pokemon.name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password: 'password',
    password_confirmation: 'password',
    birthdate: Time.at(rand * Time.now.to_i),
    bio: Faker::Hipster.paragraphs(2)
  )
end

25.times do
  s = Space.create!(
    host: User.all.sample,
    title: Faker::HarryPotter.location,
    description: Faker::Lorem.paragraph,
    price: rand(200),
    check_in: Time.current,
    check_out: Time.current + rand(5).hours,
    rules: Faker::Lorem.paragraph,
    capacity: rand(1..100),
    bathrooms: rand(10),
    size: rand(1..5000)
  )
   s.address = Address.create!(street_address: Faker::Address.street_address)
   s.categories << Category.all.sample
   s.amenities << Amenity.all.sample
end

20.times do
  a = Space.all.sample
  Booking.create!(
    user: User.all.sample,
    space: a,
    start_time: Time.current + rand(5).days,
    end_time: Time.current + rand(6..30).days,
    note: Faker::Lorem.paragraph
  )

  1.times do
     a.reviews.create!(
       user: User.all.sample,
       content: Faker::Lorem.paragraph,
       accuracy: rand(5),
       facilities: rand(5),
       communication: rand(5),
       location: rand(5)
     )
   end
end
