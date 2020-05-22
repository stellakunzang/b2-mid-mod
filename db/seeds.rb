# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

studio1 = Studio.create(name: "The Movie Studio", location: "The Moon")
studio2 = Studio.create(name: "Another Movie Studio", location: "Mars")

movie1 = Movie.create(title: "A Movie", year: "1999", genre: "Spooky", studio_id: "#{studio1.id}")
movie2 = Movie.create(title: "Movie: Sequel", year: "2002", genre: "Spooky", studio_id: "#{studio1.id}")
