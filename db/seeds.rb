# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

teachers_json = ActiveSupport::JSON.decode(File.read("db/seeds/teachers.json"))

students_json = ActiveSupport::JSON.decode(File.read("db/seeds/students.json"))

courses_json = ActiveSupport::JSON.decode(File.read("db/seeds/courses.json"))

teachers_json.each do |t|
  User.create!(t)
    # puts "A teacher is created!"
end

students_json.each do |s|
  User.create!(s)
    # puts "A student is created!"
end

courses_json.each do |c|

  keys = c.keys
  user = User.find(c[keys[0]])


  course = user.courses.create!(c[keys[1]])

  course.requirements.create!(c[keys[2]])

  puts "A course is created!"
end
