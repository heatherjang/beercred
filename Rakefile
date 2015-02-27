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

  transactions = Transaction.all
  if transactions
    transactions.each do |transaction|
      puts "deleting transaction: #{transaction.id}"
      transaction.destroy
    end
    puts "Transactions deleted"
  else
    pits "No transactions to delete"
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
  user1 = User.create(email: "President@whitehouse.gov", username: "Bill Clinton", password: "test", credit_card: "4242424242424242", beer_count: 5)
  user2 = User.create(email: "Prime_minister@canada.com", username: "Stephen Harper", password: "test", credit_card: "4242424242424242", beer_count: 3)
  user3 = User.create(email: "Rick_Grimes@zombies.com", username: "Rick Grimes", password: "test", credit_card: "4242424242424242", beer_count: 7)
  user4 = User.create(email: "Glen@zombies.com", username: "Glenn Rhee", password: "test", credit_card: "4242424242424242", beer_count: 9)
  user5 = User.create(email: "Crossbowman@zombie.com", username: "Daryl Dixon", password: "test", credit_card: "4242424242424242", beer_count: 4)
  user6 = User.create(email: "Maggie@zombies.com", username: "Maggie Greene", password: "test", credit_card: "4242424242424242", beer_count: 12)
  user7 = User.create(email: "Gov@woodbury.com", username: "The Governor", password: "test", credit_card: "4242424242424242", beer_count: 9)
  user8 = User.create(email: "redshirt@zombie.com", username: "Tyreese", password: "test", credit_card: "4242424242424242", beer_count: 2)
  user9 = User.create(email: "never_used@email.com", username: "Eugene Porter", password: "test", credit_card: "4242424242424242")

  Transaction.create(user_id: user1.id, num_purchased: user1.beer_count)
  Transaction.create(user_id: user2.id, num_purchased: user2.beer_count)
  Transaction.create(user_id: user3.id, num_purchased: user3.beer_count)
  Transaction.create(user_id: user4.id, num_purchased: user4.beer_count)
  Transaction.create(user_id: user5.id, num_purchased: user5.beer_count)
  Transaction.create(user_id: user6.id, num_purchased: user6.beer_count)
  Transaction.create(user_id: user7.id, num_purchased: user7.beer_count)
  Transaction.create(user_id: user8.id, num_purchased: user8.beer_count)
  Transaction.create(user_id: user9.id, num_purchased: user9.beer_count)

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

  puts "Transactions:"
  transactions = Transaction.all
  if transactions.size > 0
    transactions.each do |transaction|
      puts "User Id #{transaction.user_id}, Number Purchased #{transaction.num_purchased}, Date: #{transaction.created_at}"
    end
  else
    puts "No transactions in database"
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
