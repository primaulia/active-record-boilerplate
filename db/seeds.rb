require "json"
require "rest-client"
require 'faker'

puts "Clear db"
Restaurant.destroy_all
User.destroy_all

puts 'Creating restaurants...'

10.times do |index|
  puts "create restaurant #{index}"

  resto = Restaurant.new(name: Faker::Restaurant.name)
  resto.save
end

puts "Create users"

usernames = ["primaulia", "ssaunier", "defunkt"]

usernames.each do |username|
  puts "Creating #{username}"
  response = RestClient.get "https://api.github.com/users/#{username}"
  json = JSON.parse(response)
  

  new_user = User.new(first_name: json["name"], email: Faker::Internet.email)
  new_user.save
end

puts 'Finished!'