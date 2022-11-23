class DashboardController < ApplicationController
  before_action :set_user, only: [:show, :my_gear]

  def show
    @gears = Gear.all
    @rentals = Rental.where(user: @user)
  end

  def my_gear
    @gears = Gear.where(user: @user)

    @markers = @gears.geocoded.map do |gear|
      {
        lat: gear.latitude,
        lng: gear.longitude
      }
    end
  end

  private

  def set_user
    @user = current_user
  end
end
