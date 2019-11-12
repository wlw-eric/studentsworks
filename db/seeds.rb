# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  users = User.new(
      email:    Faker::Internet.email,
      password:    "123456",
      first_name:    Faker::Name.first_name ,
      last_name:    Faker::Name.last_name,
      entreprise_name: Faker::Company.name,
      role:  rand(1..2) #1-entreprise 2-intervenant
  )
  users.save!
end

10.times do
  project = Project.new(
      name: Faker::Lorem.words(number: 3),
      description:    Faker::Lorem.paragraph,
      objective:    Faker::Lorem.sentence,
      picture:    "https://image.shutterstock.com/image-vector/rocket-development-rounded-icon-style-260nw-718385470.jpg",
      category: ["Digital", "Marketing", "Design"].sample,
      creator_id: rand(1..10)
  )
  project.save!
end
