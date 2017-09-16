# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating user"

User.create(email: "email@example.com", password: "password", confirmed_email: true, access_level: 1)

puts "Create admin"
admin = User.create(email: "admin@example.com", password: "password", confirmed_email: true, access_level: 4)

puts "Creating faqs"
5.times do |n|
  Faq.create(question: "FAQ #{n+1}", answer: "Some answer #{n+1}")
end

puts "Creating super_user"
admin = User.create(email: "super@example.com", password: "password", confirmed_email: true, access_level: 5)
