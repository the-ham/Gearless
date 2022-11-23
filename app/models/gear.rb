class Gear < ApplicationRecord
  belongs_to :user

  has_many :rentals, dependent: :destroy
  has_many :reviews, through: :rentals, dependent: :destroy
  has_many_attached :photos

  validates :gear_type, presence: true
  validates :summary, presence: true
  validates :address, presence: true
  validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
