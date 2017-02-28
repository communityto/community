# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Category.create!(
  name: Faker::Lorem.word,
  )
end

10.times do
  Amenity.create!(
  name: Faker::Lorem.word,
  )
end

5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password: 'password',
    password_confirmation: 'password',
    birthdate: Time.at(rand * Time.now.to_i)
  )
end

25.times do
  s = Space.create!(
    host: User.all.sample,
    title: Faker::App.name,
    description: Faker::Lorem.paragraph,
    price: rand(200),
    check_in: Time.current,
    check_out: Time.current + rand(5).hours,
    rules: Faker::Lorem.paragraph,
    capacity: rand(100),
    bathrooms: rand(10),
    size: rand(5000)
  )
   s.categories << Category.all.sample
   s.amenities << Amenity.all.sample
end

20.times do
  s = Space.all.sample
  Booking.create!(
    user: User.all.sample,
    space: s,
    start_datetime: s.check_in + rand(5).days,
    end_datetime: s.check_out + rand(6..30).days,
    note: Faker::Lorem.paragraph
  )

  1.times do
     s.reviews.create!(
       user: User.all.sample,
       title: Faker::Lorem.sentence,
       content: Faker::Lorem.paragraph,
       rating: rand(5)
     )
   end
end
