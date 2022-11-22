class RentalsController < ApplicationController
  before_action :set_user, only: [:create, :new, :index]
  before_action :set_gear, only: [:create, :new]

  def index
    @rentals = Rental.all
  end

  def show
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    set_rental_info
    if @rental.save
      redirect_to rentals_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :price, :total)
  end

  def set_user
    @user = current_user
  end

  def set_gear
    @gear = Gear.find(params[:gear_id])
  end

  def set_rental_info
    @rental.user = @user
    @rental.gear = @gear
    @rental.price = @gear.price
    @rental.total = @rental.price * (@rental.end_date - @rental.start_date)
  end

end
