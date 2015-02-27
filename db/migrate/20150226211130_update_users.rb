class UpdateUsers < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :username
      t.string :password
      t.timestamps
    end

    create_table :users do |t|
      t.references :admin
      t.string :username
      t.string :email
      t.string :password
      t.integer :beer_count
      t.timestamps      
    end
  end
end
