class DashboardController < ApplicationController
  before_action :set_user, only: [:show, :my_gear]

  def show
    @gears = Gear.all
    @rentals = Rental.where(user: @user)
  end

  def my_gear
    @rentals_by_me = Rental.where(user: @user)
    @rentals_hosted_by_me = Rental.select { |rental| rental.gear.user == current_user }
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
