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

10.times do
  project = Project.create(
    title: Faker::Creature::Animal.name,
    description: "Projet d'exception des animaux dans son cadre naturel. Un instant de magie pure, capturé par nos photographes de renom.",
    content: Faker::Lorem.paragraph(sentence_count: 10),
    date: rand(t1..t2),
    admin_id: admin.id)
    puts "seed projects"

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