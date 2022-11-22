class Gear < ApplicationRecord
  belongs_to :user

  validates :gear_type, presence: true
  validates :summary, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
