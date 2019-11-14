# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.destroy_all
User.destroy_all

user = User.new(
      email:    "toto@gmail.com",
      password:    "123456",
      first_name:    Faker::Name.first_name ,
      last_name:    Faker::Name.last_name,
      entreprise_name: Faker::Company.name,
      role:  rand(1..2) #1-entreprise 2-intervenant
  )
user.save

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
      name: Faker::Company.bs,
      description:    Faker::Lorem.paragraph,
      objective:    Faker::Lorem.sentence,
      category: ["Digital", "Marketing", "Design"].sample,
      creator: User.all.sample
  )
  project.save!
end

n = 0
3.times do
  project = Project.all[n]
  work = Work.new(
    project: project,
    speaker: User.where.not(id: project.creator_id).sample
    )
  project.progress = 3
  project.save
  work.save
  n += 2
end

i = 1
2.times do
  project = Project.all[i]
  work = Work.new(
    project: project,
    speaker: User.where.not(id: project.creator_id).sample
    )
  project.progress = 2
  project.save
  work.save
  i += 2 
end