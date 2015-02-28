class Transaction < ActiveRecord::Base
  belongs_to :user

  validates :num_purchased, numericality: { only_integer: true, greater_than: 0 }
end