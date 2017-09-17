# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating user"

User.create(email: "email@example.com", password: "password", confirmed_email: true, access_level: 1, username: "NormalUser")

puts "Create admin"
admin = User.create(email: "admin@example.com", password: "password", confirmed_email: true, access_level: 4, username: "AdminUser")

puts "Creating faqs"
5.times do |n|
  Faq.create(question: "FAQ #{n+1}", answer: "<div> Some answer #{n+1} </div>", user_id: admin.id)
end

puts "Creating core courses"
6.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "COR111#{n+1}",
    course_type: "Core",
    difficulty: "#{10-n}",
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(100)
  )
end

puts "Creating breadth courses"
6.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "BRE111#{n+1}",
    course_type: "Breadth Elective",
    difficulty: "#{10-n}",
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(100)
  )
end

puts "Creating tech courses"
6.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "TEC111#{n+1}",
    course_type: "Tech Elective",
    difficulty: "#{10-n}",
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(100)
  )
end

puts "Creating super_user"
s_user = User.create(email: "super@example.com", password: "password", confirmed_email: true, access_level: 5, username: "SuperUser")
