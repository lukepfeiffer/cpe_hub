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
10.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "COP111#{n+1}",
    course_type: "Core",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

7.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "EEL111#{n+1}",
    course_type: "Core",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

puts "Creating breadth courses"
5.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "STA111#{n+1}",
    course_type: "Breadth Elective",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

5.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "EGM311#{n+1}",
    course_type: "Breadth Elective",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

5.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "EES211#{n+1}",
    course_type: "Breadth Elective",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

5.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "EGS411#{n+1}",
    course_type: "Breadth Elective",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

5.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "ECH311#{n+1}",
    course_type: "Breadth Elective",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

puts "Creating tech courses"

5.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "STA411#{n+1}",
    course_type: "Tech Elective",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

5.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "COP311#{n+1}",
    course_type: "Tech Elective",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

5.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "CIS311#{n+1}",
    course_type: "Tech Elective",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

5.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "MAC411#{n+1}",
    course_type: "Tech Elective",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

5.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "PHY411#{n+1}",
    course_type: "Tech Elective",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

5.times do |n|
  description = Faker::Lorem.paragraph
  Course.create(
    name: Faker::Company.catch_phrase,
    course_code: "EEL411#{n+1}",
    course_type: "Tech Elective",
    difficulty: rand(1..10),
    description: "<div> #{description} </div>",
    desc_preview: description.truncate(80)
  )
end

puts "Creating super_user"
s_user = User.create(email: "super@example.com", password: "password", confirmed_email: true, access_level: 5, username: "SuperUser")
