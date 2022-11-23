class DashboardController < ApplicationController
  before_action :set_user, only: [:show, :my_gear]

  def show
    @gears = Gear.all
    @rentals = Rental.where(user: @user)
  end

  def my_gear
    @gears = Gear.where(user: @user)
  end

  private

  def set_user
    @user = current_user
  end
end
