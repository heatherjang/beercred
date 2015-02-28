class Admin < ActiveRecord::Base
  has_many :users

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :inventory, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end