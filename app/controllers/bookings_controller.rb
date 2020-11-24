class BookingsController < ApplicationController
   before_action :find_booking, only: [:show, :edit, :destroy]

  def dashboard
    @bookings = Booking.all
  end

  def show
    @booking
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(strong_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @booking
  end

  def update
    @booking
    @booking.update(strong_params)
    redirect_to dahsboard_path
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def strong_params
    params.require(:watch).permit(:id, :description, :price)
  end

end
