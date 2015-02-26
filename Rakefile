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
  User.create(email: "President@whitehouse.gov", username: "Bill Clinton", password: "test")
  Admin.create(email: "God@fridge.beer", username: "God", password: "test")
end

desc "view db"
task "db:view" do
  puts "Users:"
  users = User.all
  if users.size > 0
    users.each do |user|
      puts "Name #{user.username}, E-mail #{user.email}, Password: #{user.password}"
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
