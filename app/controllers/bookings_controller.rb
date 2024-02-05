class BookingsController < ApplicationController
  before_action :set_pet, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    @booking.pet = @pet
    @booking.user = current_user
    @booking.save
    redirect_to pet_path(@pet)
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_id)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

end
