class User < ActiveRecord::Base
  belongs_to :admin
  has_many :transactions

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :beer_count, presence: true, numericality: { only_integer: true }
  validates :password, presence: true
end