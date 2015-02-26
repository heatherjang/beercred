class AddCredit < ActiveRecord::Migration
  def change
    change_column_default :users, :beer_count, 0
    add_column :users, :credit_card, :string
  end
end
