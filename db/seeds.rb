# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# User.create!(name:  "admin",
#              email: "admin@gmail.com",
#              password:              "123456",
#              password_confirmation: "123456",
#              admin: true)

# 30.times do |n|
#  name  = Faker::Name.name
#  email = "example-#{n+1}@railstutorial.org"
#  password = "password"
#  User.create!(name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password)
# end
30.times do |n|
  name = Faker::Name.name
  country = Faker::Address.country
  age = 1
  Author.create!(name: name,
                country: country,
                age: age)
end
30.times do |n|
  name = Faker::Name.name
  address = country = Faker::Address.city
  Publisher.create!(name: name,
                    address: address)
end
30.times do |n|
  name = Faker::Book.title
  describe = Faker::Book.genre
  price = Faker::Number.decimal(l_digits: 3, r_digits: 3)
  image = Faker::Avatar.image(slug: "my-own-slug")
  Book.create!(name: name,
              describe: describe,
              image: image,
              price: price)
end
30.times do |n|
  book_id = rand(1..30)
  author_id = rand(1..30)
  AuthorBook.create!(book_id: book_id,
                      author_id: author_id)
end
30.times do |n|
  book_id = rand(1..30)
  publisher_id = rand (1..30)
  BookPublisher.create!(book_id: book_id,
                        publisher_id: publisher_id)
end
