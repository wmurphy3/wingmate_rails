# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by!(email: "clmurphy789@gmail.com") do |user|
  user.encrypted_password = "cM!@#456"
  user.is_admin = true
  user.first_name = "Clinton"
  user.last_name = "Murphy"
end

User.find_or_create_by!(email: "chandlercorey15@gmail.com") do |user|
  user.encrypted_password = "cC!@#456"
  user.is_admin = true
  user.first_name = "Corey"
  user.last_name = "Chandler"
end

User.find_or_create_by!(email: "willardtwashington@gmail.com") do |user|
  user.encrypted_password = "wM!@#456"
  user.is_admin = true
  user.first_name = "William"
  user.last_name = "Murphy"
end
