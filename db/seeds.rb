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

#admins initialization
admin_first_names = %w[Steeve Romane Lucas Martin]
admin_last_names = %w[Voccia Charraud Bischoff Bondonneau]
admin_pseudos = %w[Steeve Romane Lucas Martin]
admin_descriptions = ["Steeve est un cadreur et droniste émérite. De l’animation aux drones, il est le touche à tout de l’équipe.", "Romane est une femme engagée et pétillante qui aime réaliser des portraits touchants et intimistes.", "Lucas est un amoureux de la nature et de ses bruits. Il transforme l’image en poésie et la prise de son en mélodie.", "Martin est une usine à mondes. Il nous transporte à travers des contrées inexplorées, toujours à l'affût de nouvelles techniques."]
admin_specialities = ["Expert Porcin", "Expert Buse", "Expert Nuit", "Expert Pixel"]
admin_emails = %w[steeve@yopmail.com romane@yopmail.com lucas@yopmail.com martin@yopmail.com]
admin_passwords = %w[steeve romane lucas0 martin]

for i in 0..3 do
  admin = Admin.create(
    first_name:admin_first_names[i],
    last_name:admin_last_names[i],
    pseudo:admin_pseudos[i],
    description:admin_descriptions[i],
    speciality:admin_specialities[i],
    email:admin_emails[i],
    password:admin_passwords[i]
  )
end
puts "admins initalized"


#categories initialization
category_names = ["Institutionnel", "Communication", "Documentaire", "Animalier", "Animation", "Portrait", "Expérimental", "Pellicule", "Drone"]

for i in 0..8 do
  category = Category.create(
    category_name: category_names[i]
  )
end
puts "categories initalized"


#projects initialization
project_titles=[i]
project_descriptions=[i]
project_contents=[i]

for i in 0..15 do
  project = Project.create(
    title: project_titles[i],
    description: project_descriptions[i],
    content: project_contents[i],
    admin_id: Admin.all.sample
  )
  project.categories << Category.all.sample(2)
end
puts "projects initialized"

 
#articles initialization
article_titles=[i]
article_descriptions=[i]
article_contents=[i]

for i in 0..15 do
  article = Article.create(
    title: article_titles[i],
    description: article_descriptions[i],
    content: article_contents[i],
    admin_id: Admin.all.sample
  )
end
puts "articles initialized"

#contacts initialization
contact1 = Contact.create(
  email: "jacqueline@mail.com",
  name: "Jacqueline Poulet",
  status: "Particulier",
  subject: "Bravo pour votre travail !",
  content: "Je tenais à vous féliciter personnellement pour ce travail magnifique que vous fournissez chaque jour afin de nous faire goûter à tous une nature un peu plus belle chaque jour. Continuez comme ça! Et ne lâchez rien face au loby chasseur qui crève vos pneus tous les mois ! On les aura!"
)

contact2 = Contact.create(
  email: "robert@mail.com",
  name: "Robert Chasseur",
  status: "Professionnel",
  subject: "Des comptes à régler !",
  content: "Je tenais à vous dire que votre venus dans le Jura sur nos terres de chasse ne nous enchante guère... Les projections et débats que vous organisez n'intéresse personne de toutes façons! Atention le plomb ça part vite!!!!!!!!"
)

puts "contacts initialized"


#events initialization
event_titles=[i]
event_descriptions=[i]
event_contents=[i]
event_dates=[i]
event_locations=[i]

for i in 0..15 do
  event = Event.create(
    title: event_titles[i],
    description: event_descriptions[i],
    content: event_contents[i],
    date: event_dates[i],
    location: event_locations,
    admin_id: Admin.all.sample
  )
end
puts "events initialized"



    v.image.attach(io: File.open('/path/to/file'), filename: 'file.jpg')
    