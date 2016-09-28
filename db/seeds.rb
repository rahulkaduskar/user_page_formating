# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
4.times do |n| 
  cust = User.new
  cust.name = "user#{n}"
  cust.email = "user#{n}@test.com"
  cust.password = "test123"
  cust.password_confirmation = "test123"
  cust.save!  
end