# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

puts 'Creating 5 fake users with 2 fakes planet for each user...'
5.times do
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email(name: :username),
    password: Faker::Internet.password(min_length: 8),
    address: Faker::Space.galaxy
  )
  user.save!

  2.times do
    planet = Planet.new(
      name: Faker::Space.planet,
      description: Faker::Space.constellation,
      address: Faker::Space.galaxy,
      price: rand(1000..5000),
      user_id: user.id,
      start_date: Date.today,
      end_date: Date.today + rand(5..20)
    )
    planet.save!
  end
end

puts 'Finished!'

puts 'Creating 1 fake reservation...'
  reservation = Reservation.new(
    status: "pending",
    start_date: Date.today,
    end_date: Date.today + 5,
    user_id: User.all.sample.id,
    planet_id: Planet.all.sample.id
  )
  reservation.save!
puts 'Finished!'

puts 'Creating 1 fake review...'
  review = Review.new(
    note: 4,
    content: "Sympa",
    user_id: reservation.user_id,
    reservation_id: reservation.id
  )
  review.save!
puts 'Finished!'
