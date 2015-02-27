class Transactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user
      t.integer :num_purchased
      t.timestamps
    end
  end
end
