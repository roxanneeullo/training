# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..20).each do |i|
  department_name = Faker::StarWars.planet
  Department.create(department_name: department_name )
end

(1..50).each do |i|
  first_name = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email      = Faker::Internet.free_email("#{first_name} #{last_name}")
  position   = Faker::Name.title
  username   = Faker::Zelda.character
  password   = Faker::Pokemon.name
  department = Department.where(id:(rand(1..Department.count))).first
  department_id = department.id
  User.create(first_name: first_name, last_name: last_name, email: email, position: position, username: username, password: password, department_id: department_id )
end

(1..20).each do |i|
  content = Faker::StarWars.wookie_sentence
  user = User.where(id:(rand(1..User.count))).first
  user_id = user.id
  Post.create(content: content, user_id: user_id )
end