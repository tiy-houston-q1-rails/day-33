# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
  User.create! status: 'active',
               email: Faker::Internet.email,
               password: 'password',
               password_confirmation: 'password',
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               title: Faker::Name.title,
               bio: Faker::Company.catch_phrase,
               twitter: Faker::Internet.user_name,
               last_job_title: Faker::Name.title
end
