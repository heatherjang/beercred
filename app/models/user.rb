class User < ActiveRecord::Base
  belongs_to :admin
  has_many :transactions, dependant: :destroy

  validates :email, presence: true, uniqueness: true
  validates :beer_count, presence: true, numericality: { only_integer: true }
  validates :password, presence: true
end