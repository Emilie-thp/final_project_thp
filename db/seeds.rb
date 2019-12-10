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
Event.destroy_all
Admin.destroy_all

admin = Admin.create(email: "admin@yopmail.com", password: "thpstrabourg")

categories_array = ["Institutionnel", "Communication", "Documentaire", "Animalier", "Photographie", "Animation", "Portrait", "Expérimental", "Pellicule", "Drone"]

t1 = Date.parse("2019-12-31")
t2 = Date.parse("2022-01-01")

project_names = ["Le lièvre du Jura","Le cochon des prés","L'hippo du ter-ter","La galinette sandrée","Le aye-aye perché","L'atome de foin","Le cerf majestueux","L'envol de l'oiseau","La mare aux canards","Le chat perché","A fleur d'eau","L'autruche greluche","Flicaille la canaille","Le chien qui aboit","La peau de l'ours","Roule ta moule"]

event_names = ["Stand sur la chimie verte","L'agriculture biologique","Scène de bêtes","Papier Ciseaux Forêt Oiseaux","E=mc2","Temps à histoires", "La forêt dans la transition écologique","Atélier Co-écologique","Atélier Bee to Bee", "Les controverses Ecologiques","Demain,hier", "Atelier Fresque du climat"]

i=0 
10.times do
  project = Project.create(title: project_names[i],
                           description: "Un projet réalisé par l'association Oeil de Biche, en partenariat avec la commune de la Pesse et les Parcs Naturels du Jura.",
                           content: Faker::Lorem.paragraph(sentence_count: 40),
                           date: rand(t1..t2),
                           admin_id: admin.id)
  i+=1
  puts "seed projects"
 
end

j=0
10.times do
  article = Article.create(title: project_names[j],
                           description: "Un article sur la faune et la flore du Jura par l'association Oeil de Biche.",
                           content: Faker::Lorem.paragraph(sentence_count: 80),
                           admin_id: admin.id)
  j+=1
  puts "seed articles"
end


10.times do
  category = Category.create(category_name: categories_array.sample)
  puts "seed categories"
end

contact = Contact.create(email: "contact@mail.com",
                         name: "Visiteur0",
                         status: ["Particulier","Professionnel"].sample,
                         subject: "Message du visiteur n°",
                         content: Faker::Lorem.paragraph(sentence_count: 5)
                          )
puts "seed 1 message"


l=0
10.times do
  event = Event.create(title: event_names[l],
                        description: "Une actualité qui valorise et respecte l'environnement.",
                        content: Faker::Lorem.paragraph(sentence_count: 40),
                        date: rand(t1..t2),
                        location: Faker::Address.city,
                        admin_id: admin.id)
  l+=1
  puts "seed events"
end
