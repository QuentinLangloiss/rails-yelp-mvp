# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
# epicure = { name: 'Epicure', category: 'french', address: '75008 Paris' }
# dishoom = { name: 'Dishoom', category: 'belgian', address: '7 Boundary St, London E2 7JE' }
# pizza_east = { name: 'Pizza East', category: 'italian', address: '56A Shoreditch High St, London E1 6PQ' }
# rails = { name: 'Rails', category: 'japanese', address: '75 Tokyo' }
# java = { name: 'Java', category: 'chinese', address: '8 rue Pekin' }

5.times do
  posts = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w[chinese italian japanese french belgian].sample
  )
  posts.save!
  rand(0..3).times do
  add = Review.new(
    rating: rand(0..5),
    content: Faker::Restaurant.description,
    restaurant: posts
  )
  add.save!
  end
end

# yummy = {content: 'yummy yummy', rating: 4}
# miam = { content: 'miam miam', rating: 5 }
# bof = { content: 'miam', rating: 3 }
# notgood = { content: 'aaaaa', rating: 2 }
# run = { content: 'bye', rating: 1 }

# yummy.epicure = epicure
# miam.dishoom = dishoom
# bof.pizza_east = pizza_east
# notgood.rails = rails
# run.java = java

# [epicure, dishoom, pizza_east, rails, java].each do |attributes|
#   restaurant = Restaurant.create!(attributes)
#   puts "Created #{restaurant.name}"
# end
# puts 'Finished!'
