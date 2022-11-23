class Gear < ApplicationRecord
  belongs_to :user
  
  has_many :rentals, dependent: :destroy
  has_many :reviews, through: :rentals, dependent: :destroy

  validates :gear_type, presence: true
  validates :summary, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
