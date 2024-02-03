class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.save
  end

  private

  # def pet_params
  #   params.require(:pet).permit(:name, :age, :species, :gender, :price)
  # end
end
