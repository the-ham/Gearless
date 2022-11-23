class RentalsController < ApplicationController
  before_action :set_user, only: [:create, :new, :index, :update, :edit, :destroy]
  before_action :set_gear, only: [:create, :new]

  # index view of all rentals where i am the renter
  def index
    @rentals = Rental.where(user: @user)
  end

  # index view of all rentals made by other renters where i am the host
  def host_show
    @rentals = Rental.select { |rental| rental.gear.user == current_user }
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    set_rental_info
    if @rental.save
      redirect_to user_rentals_path(@user), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @rental = Rental.find(params[:id])
    if @rental.update(rental_params)
      if current_user.id == @rental.user_id
        redirect_to user_rentals_path(@user)
      else
        redirect_to host_show_path(@user)
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to user_rentals_path(@user), notice: "Rental was successfully destroyed."
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :price, :total, :status)
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
