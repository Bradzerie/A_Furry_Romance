class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @pet = Pet.new
    @bookings = Booking.where(user_id: current_user)
    @pet_bookings = Booking.where(pet_id: current_user)
  end
end
