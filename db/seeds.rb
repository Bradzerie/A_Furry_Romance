require 'faker'

puts 'deleting all pets'
Pet.destroy_all

puts 'deleting all users'
User.destroy_all

puts 'creating one user'

user = User.new(
  email: 'test@email.com',
  password: 'password'
)
user.save!

puts "created #{User.count} users"

puts 'creating 10 pets for testing'

10.times do
  cat = Pet.new(
    name: Faker::Creature::Cat.name,
    age: rand(0..15),
    species: Pet::SPECIES.sample,
    gender: Pet::GENDER.sample,
    price: rand(15..500)
  )
  cat.user = user
  cat.save!
end

puts "added #{Pet.count} pets"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
