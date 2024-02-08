class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet, only: [:index, :new, :create, :show]


  def index
    @bookings = Booking.where(pet_id: @pet.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    @booking.status = 'Pending'

    if @booking.save
      redirect_to pet_booking_path(@pet, @booking), notice: "Your booking request is on it's way to #{@pet.name}'s owner..."
    else
      puts @booking.errors.full_messages
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = 'Confirmed'

    if @booking.save
      flash[:success] = "Booking has been approved!"
      redirect_to dashboard_path
    else
      flash[:error] = "Failed to approve booking."
      redirect_to dashboard_path
    end
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.status = 'Declined'

    if @booking.save
      flash[:success] = "Booking has been approved!"
      redirect_to dashboard_path
    else
      flash[:error] = "Failed to approve booking."
      redirect_to dashboard_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_id, :user_id)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
