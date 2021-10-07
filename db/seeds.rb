# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
BugTicket.destroy_all

User.create!(email: 'dave@gmail.com', password: 'password', admin: true, role: 'admin')

30.times do |instance|
  user = User.create!(email: Faker::Internet.email, password: 'password', role: 'user')
  User.create!(email: Faker::Internet.email, password: 'password', role: 'support')

  BugTicket.create!(
    bug_behavior: Faker::Lorem.sentence(word_count: 25),
    environment: Faker::Lorem.sentence(word_count: 25),
    priority: 'low',
    owner: user.email,
    category: 'bug',
    status: 'open'
  )
end

24.times do |instance|
  user = User.create!(email: Faker::Internet.email, password: 'password', role: 'user')
  BugTicket.create!(
    bug_behavior: Faker::Lorem.sentence(word_count: 25),
    environment: Faker::Lorem.sentence(word_count: 25),
    priority: 'medium',
    owner: user.email,
    status: 'in_progress',
    category: 'training_documents'
  )
  
end
12.times do |instance|
  user = User.create!(email: Faker::Internet.email, password: 'password', role: 'user')
  BugTicket.create!(
    bug_behavior: Faker::Lorem.sentence(word_count: 25),
    environment: Faker::Lorem.sentence(word_count: 25),
    priority: 'high',
    owner: user.email,
    status: 'additional_info',
    category: 'other'
  )
end
6.times do |instance|
  user = User.create!(email: Faker::Internet.email, password: 'password', role: 'user')
  BugTicket.create!(
    bug_behavior: Faker::Lorem.sentence(word_count: 25),
    environment: Faker::Lorem.sentence(word_count: 25),
    priority: 'urgent',
    owner: user.email,
    status: 'closed',
    category: 'feature_requests'
  )
end

  


p "Created #{User.count} users, #{BugTicket.count} tickets"
