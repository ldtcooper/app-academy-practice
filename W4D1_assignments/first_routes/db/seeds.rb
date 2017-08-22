# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times { User.create(username: Faker::Ancient.hero) }
20.times { Artwork.create(title: Faker::Hipster.sentence(rand(1..4)), image_url: Faker::Placeholdit.image, artist_id: rand(13..16))}
