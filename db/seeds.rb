# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Project.destroy_all
Article.destroy_all
Category.destroy_all
Admin.destroy_all

admin = Admin.create(email: "admin@yopmail.com", password: "thpstrabourg")

categories_array = ["Institutionnel", "Communication", "Documentaire", "Animalier", "Photographie", "Animation", "Portrait", "Expérimental", "Pellicule", "Drone"]

t1 = Date.parse("2019-12-31")
t2 = Date.parse("2022-01-01")

project_names = ["Le lièvre du Jura","Le cochon des prés","L'hippo du ter-ter","La galinette sandrée","Le aye-aye perché","L'atome de foin","Le cerf majestueux","L'envol de l'oiseau","La mare aux canards","Le chat perché","A fleur d'eau","L'autruche greluche","Flicaille la canaille","Le chien qui aboit","La peau de l'ours","Roule ta moule"]

i=1 
15.times do
  project = Project.create(title: project_names[i-1],
                           description: "Un projet réalisé par l'association Oeil de Biche, en partenariat avec la commune de la Pesse et les Parcs Naturels du Jura.",
                           content: Faker::Lorem.paragraph(sentence_count: 40),
                           date: rand(t1..t2),
                           admin_id: admin.id)
  project.thumbnail.attach(io: File.open("./storage/image#{i}.jpg"), filename: "image#{i}.jpg")
  project.pictures.attach(io: File.open("./storage/image#{i+10}.jpg"), filename: "diaporama#{i}.jpg")
  project.pictures.attach(io: File.open("./storage/image#{i+11}.jpg"), filename: "diaporama#{i}.jpg")
  project.pictures.attach(io: File.open("./storage/image#{i+12}.jpg"), filename: "diaporama#{i}.jpg")
  puts "seed projects"
  i+=1
end

j=1
10.times do
  article = Article.create(title: project_names[j],
                           description: "Un article sur la faune et la flore du Jura par l'association Oeil de Biche.",
                           content: Faker::Lorem.paragraph(sentence_count: 80),
                           admin_id: admin.id)
  puts "seed articles"
end


10.times do
  category = Category.create(category_name: categories_array.sample)
  puts "seed categories"
end

k=1
10.times do
  contact = Contact.create(email: "contact#{k}@mail.com",
                           name: "Visiteur0#{k}",
                           status: ["Particulier","Professionnel"].sample,
                           subject: "Message du visiteur n°#{k}",
                           content: Faker::Lorem.paragraph(sentence_count: 5)
                          )
  puts "seed messages"
end