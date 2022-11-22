class GearsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @gears = Gear.all
  end

  def new
    @user = current_user
    @gear = Gear.new
  end

  def show
    @gear = Gear.find(params[:id])
  end

  def create
    @user = current_user
    @gear = Gear.new(gear_params)
    @gear.user = @user
    if @gear.save
      redirect_to root_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def gear_params
    params.require(:gear).permit(:gear_type, :total_occupancy, :summary, :address, :price, :latitude, :longitude)
  end
end
