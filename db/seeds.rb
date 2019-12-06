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

project_names = ["Le lièvre du Jura"; "Le cochon des prés" ; "L'hippo du ter-ter" ; "La galinette sandrée" ; "Le aye-aye perché" ; "L'atome crochue" ; "Le cerf majestueux" ; "L'envol de l'oiseau" ; "La mare aux canards" ; "Le chat perché" ; "A fleur d'eau" ; "L'autruche greluche" ; "Flicaille la canaille" ; "Le chien qui aboit" ; "La peau de l'ours" ; "Roule ta moule"]

i=1 

15.times do
  project = Project.create(title: project_names[i-1],
                           description: "Un projet réalisé par l'association Oeil de Biche, en partenariat avec la commune de la Pesse et les Parcs Naturels du Jura.",
                           content: Faker::Lorem.paragraph(sentence_count: 20),
                           date: rand(t1..t2),
                           admin_id: admin.id)
  project.thumbnail.attach(io: File.open("./storage/image#{i}.jpg"), filename: "image#{i}.jpg")
  project.picture.attach(io: File.open("./storage/image#{i+10}.jpg"), filename: "diaporama#{i}.jpg")
  project.picture.attach(io: File.open("./storage/image#{i+11}.jpg"), filename: "diaporama#{i}.jpg")
  project.picture.attach(io: File.open("./storage/image#{i+12}.jpg"), filename: "diaporama#{i}.jpg")
  puts "seed projects"
  i+=1
end


10.times do
    article = Article.create(
      title: Faker::Creature::Animal.name,
      description: "Article d'exception des animaux dans son cadre naturel. Un instant de magie pure, capturé par nos photographes de renom.",
      content: Faker::Lorem.paragraph(sentence_count: 20),
      admin_id: admin.id)
      puts "seed articles"

  end


10.times do
    category = Category.create(
      category_name: categories_array.sample)
      puts "seed categories"

end