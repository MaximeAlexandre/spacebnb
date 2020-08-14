# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

User.destroy_all

puts 'Creating 5 fake users with 2 fakes planet for each user...'
User.create(
  username: "Maxou",
  email: "alexandre.maxime666@gmail.com",
  password: "starwars",
  address: "Orion"
)

User.create(
  username: "Antho",
  email: "anthony.manto@free.fr",
  password: "azerty",
  address: "Milky Way"
)

User.create(
  username: "sebcoppo",
  email: "sebcoppo@yahoo.fr",
  password: "sc**spacebnb",
  address: "Andromeda"
)

User.create(
  username: "Bastou",
  email: "bastien@gmail.com",
  password: "nbvcxw",
  address: "Serpentar"
)

puts 'Finished!'
