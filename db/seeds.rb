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

  s = Space.create!(
    host: User.all.sample,
    title: "Bitmaker",
    description: "learn to code!",
    price: 300,
    check_in: Time.current,
    check_out: Time.current + rand(5).hours,
    rules: "just have fun :)",
    capacity: rand(1..100),
    bathrooms: rand(10),
    size: rand(1..5000)
  )

  a = Address.create!(
   street_address: "220 King St W",
   city: "Toronto",
   province: "Ontario"
  )

   s.address = a
   s.categories = Category.all.sample(rand(1..2))

   s2 = Space.create!(
     host: User.all.sample,
     title: "Starbucks",
     description: "Drink overpriced coffee.",
     price: 100,
     check_in: Time.current,
     check_out: Time.current + rand(5).hours,
     rules: "none",
     capacity: rand(1..100),
     bathrooms: rand(10),
     size: rand(1..5000)
   )

   a2 = Address.create!(
    street_address: "120 Yonge Street",
    city: "Toronto",
    province: "Ontario"
   )

   s2.address = a2
   s2.categories = Category.all.sample(rand(1..2))


   s3 = Space.create!(
     host: User.all.sample,
     title: "Cherry Cola's Cabaret",
     description: "Drink whiskey",
     price: 100,
     check_in: Time.current,
     check_out: Time.current + rand(5).hours,
     rules: "none",
     capacity: rand(1..100),
     bathrooms: rand(10),
     size: rand(1..5000)
   )

   a3 = Address.create!(
    street_address: "200 Bathurst Street",
    city: "Toronto",
    province: "Ontario"
   )

   s3.address = a3
   s3.categories = Category.all.sample(rand(1..2))


   s4 = Space.create!(
     host: User.all.sample,
     title: "Nocturne",
     description: "Weird raves.",
     price: 100,
     check_in: Time.current,
     check_out: Time.current + rand(5).hours,
     rules: "none",
     capacity: rand(1..100),
     bathrooms: rand(10),
     size: rand(1..5000)
   )

   a4 = Address.create!(
    street_address: "550 Queen Street West",
    city: "Toronto",
    province: "Ontario"
   )

   s4.address = a4
   s4.categories = Category.all.sample(rand(1..2))


   s5 = Space.create!(
     host: User.all.sample,
     title: "The Smiling Buddha",
     description: "Cheap shots",
     price: 100,
     check_in: Time.current,
     check_out: Time.current + rand(5).hours,
     rules: "none",
     capacity: rand(1..100),
     bathrooms: rand(10),
     size: rand(1..5000)
   )

   a5 = Address.create!(
    street_address: "961 College Street",
    city: "Toronto",
    province: "Ontario"
   )

   s5.address = a5
   s5.categories = Category.all.sample(rand(1..2))
