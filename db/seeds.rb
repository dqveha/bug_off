# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

account = User.create!(:email => "dave@gmail.com", :password => "password", :admin => true, :role => "user")

10.times do |user_instance|
  User.create!(:email => Faker::Internet.email, :password => "password", :role => "user")
  User.create!(:email => Faker::Internet.email, :password => "password", :role => "support")
end

p "Created #{User.count} users"