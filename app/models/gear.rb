class Gear < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :reviews, through: :rentals
  validates :gear_type, presence: true
  validates :summary, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
