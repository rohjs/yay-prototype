# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |i|
  User.create(
    email: "woohyeon#{i}@gmail.com",
    name: "wooheyon#{i}",
    user_type: 1,
    phone_number: "xxx-xxx-xxxx",
    department: rand(1..5),
    password: "123123",
    password_confirmation: "123123"
  )
  puts "woohyeon#{i} created!"
end


5.times do |i|
  User.create(
    email: "chanha#{i}@naver.com",
    name: "chanha#{i}",
    user_type: 0,
    phone_number: "xxx-xxx-xxxx",
    department: rand(1..5),
    password: "123456",
    password_confirmation: "123456"
  )
  puts "chanha#{i} created!"
end
