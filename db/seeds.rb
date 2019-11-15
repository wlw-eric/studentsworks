# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:    http://ludismedia.com/wp-content/uploads/2013/10/Challenge-accepted.jpg
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Work.destroy_all
Project.destroy_all
User.destroy_all

user = User.create(
      email:    "toto@gmail.com",
      password:    "123456",
      first_name:    'Pauline' ,
      last_name:    'Eustachy',
      entreprise_name: 'El Wagon',
      role:  rand(1..2) #1-entreprise 2-intervenant
  )

bob = Project.create(
      name: "Etude de Barney Stinson",
      description:    "Le but final est de chercher quel est le poste de Barney chez la GNB",
      objective:    "Trouver le travail de Barney",
      category: "Digital",
      creator: user
  )


bob2 = Project.create(
      name: "Etude de la radioactivité en Ukraine",
      description:    "Qu'est ce que la radioactivité ? Comment se protéger",
      objective:    "Etude sur la radioactivité",
      category: "Digital",
      creator: user
  )


  bob3 = Project.create(
      name: "Utilité des mouches dans la pub",
      description:    "Dans la pub, nous utilisons tous des mouches. On aimerait en connaître un peu sur le sujet de fond.",
      objective:    "Pourquoi on utilise des mouches ?",
      category: "Marketing",
      creator: user
  )


user2 = User.create(
      email:    "tata@gmail.com",
      password:    "123456",
      first_name:    'Bob' ,
      last_name:    'Bobby',
      entreprise_name: 'El Wagonnette',
      role:  rand(1..2) #1-entreprise 2-intervenant
  )


bob4 = Project.create(
      name: "Le pourquoi du comment ?",
      description:    "On sait tous comment, mais on ne sait pas pourquoi. Savons-nous le pourquoi du comment ?",
      objective:    "Pourquoi et comment ? Comment pourquoi et comment ?",
      category: "Marketing",
      creator: user2
  )


bob5 = Project.create(
      name: "Margarine",
      description:    "Etude de fond : comparer la composition de la margarine au beurre. Peut-on vendre la margarine comme étant du beurre.",
      objective:    "Margarine = beurre ?",
      category: "Marketing",
      creator: user2
  )


  bob6 = Project.create(
      name: "UX",
      description:    "Contact pour info",
      objective:    "Refaire ux",
      category: "Design",
      creator: user2
  )


  work1 = Work.create(
    speaker_id: user,
    project_id: bob4
    )



  work2 =  Work.create(
    speaker_id: user2,
    project_id: bob3
    )
