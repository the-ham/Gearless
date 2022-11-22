class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :gear

  validate :validate_rent_time

  def validate_rent_time
    if self.end_date <= self.start_date
      errors.add("Your start date can't be later than end date!")
    elsif self.start_date < Time.now
      errors.add("Start from a date after today!")
    end
  end

end
