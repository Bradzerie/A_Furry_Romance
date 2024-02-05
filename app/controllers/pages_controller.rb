class PagesController < ApplicationController
  # before_action :set_user, only: %i[dashboard]

  def home
  end


  def dashboard
    # @user = User.find(params[:user_id])
    # @pet.user_id = @user
    # alternative code to use:
    # @pets = @user.pets
  end
end
