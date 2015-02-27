require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)


desc "clean db"
task "db:clean" do
  users = User.all
  if users
    users.each do |user|
      puts "deleting #{user.username}"
      user.destroy
    end
    puts "Users deleted"
  else
    puts "No users to delete"
  end
  admins = Admin.all
  if admins
    admins.each do |admin|
      puts "deleting #{admin.username}"
      admin.destroy
    end
    puts "Admins deleted"
  else
    puts "No admins to delete"
  end
end

desc "populate db"
task "db:populate" do
  puts "Populating Database"
  User.create(email: "President@whitehouse.gov", username: "Bill Clinton", password: "test", credit_card: "4242424242424242", beer_count: 5)
  User.create(email: "Prime_minister@canada.com", username: "Stephen Harper", password: "test", credit_card: "4242424242424242", beer_count: 3)
  User.create(email: "Rick_Grimes@zombies.com", username: "Rick Grimes", password: "test", credit_card: "4242424242424242", beer_count: 7)
  User.create(email: "Glen@zombies.com", username: "Glenn Rhee", password: "test", credit_card: "4242424242424242", beer_count: 9)
  User.create(email: "Crossbowman@zombie.com", username: "Daryl Dixon", password: "test", credit_card: "4242424242424242", beer_count: 4)
  User.create(email: "Maggie@zombies.com", username: "Maggie Greene", password: "test", credit_card: "4242424242424242", beer_count: 12)
  User.create(email: "Gov@woodbury.com", username: "The Governor", password: "test", credit_card: "4242424242424242", beer_count: 9)
  User.create(email: "redshirt@zombie.com", username: "Tyreese", password: "test", credit_card: "4242424242424242", beer_count: 2)
  User.create(email: "never_used@email.com", username: "Eugene Porter", password: "test", credit_card: "4242424242424242")

  Admin.create(email: "God@fridge.beer", username: "God", password: "test")
end

desc "view db"
task "db:view" do
  puts "Users:"
  users = User.all
  if users.size > 0
    users.each do |user|
      puts "Name #{user.username}, E-mail #{user.email}, Password: #{user.password}, Credit Card: #{user.credit_card}"
    end
  else
    puts "No Useres in database"
  end
  puts "Admins:"
  admins = Admin.all
  if admins.size > 0
    admins.each do |admin|
      puts "Name #{admin.username}, E-mail #{admin.email}, Password: #{admin.password}"
    end
  else
    puts "No Admins in database"
  end
end
