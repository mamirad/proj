# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'admin@gmail.com', name: 'Ahmad admin',role: 'admin', password: 'aaaaaa' )
User.create(email: 'teacher@gmail.com', name: 'Aslam',role: 'teacher', password: 'aaaaaa' )
User.create(email: 'punjab@gmail.com', name: 'Numan',role: 'punjab', password: 'aaaaaa' )
User.create(email: 'federal@gmail.com', name: 'Farhan',role: 'federal', password: 'aaaaaa' )





Group.create(group_name: "5th")
Group.create(group_name: "6th")
Group.create(group_name: "7th")
Group.create(group_name: "8th")
Group.create(group_name: "9th")
Group.create(group_name: "10th")
Group.create(group_name: "11th")