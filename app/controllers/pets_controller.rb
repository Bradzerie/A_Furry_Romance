class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_new_path(@pet), notcie: "Your pet is ready for listing"
    else
      puts @pet.errors.full_messages
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path(@pet.user), status: :see_other
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :description, :price)
  end

end
