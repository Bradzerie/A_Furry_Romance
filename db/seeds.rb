require 'faker'

puts 'deleting all pets'
Pet.destroy_all

puts 'deleting all users'
User.destroy_all

puts 'creating one user'

user1 = User.new(
  email: 'mark@gmail.com',
  password: 'password'
)
user1.save!

user2 = User.new(
  email: 'sam@gmail.com',
  password: 'password'
)
user2.save!

user3 = User.new(
  email: 'mike@gmail.com',
  password: 'password'
)
user3.save!

users = [user1, user2, user3]

puts "created #{User.count} users"

puts 'creating 10 pets for testing'

users.each do |user|
  4.times do
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
end

puts "added #{Pet.count} pets"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
