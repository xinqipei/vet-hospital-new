class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :destroy, :edit, :update]
  def index
    @pets_search = current_user.pets.ransack(params[:q])
    @pets = @pets_search.result(distinct: true)
  end


  def show
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pets_path
    else
      render :edit
    end
  end

  def create
    @pet_form = PetForm.new(pet_params)
      if @pet_form.persist
        redirect_to pets_path
      else
        redirect_to new_pet_path
      end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private
    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :age, :medical_history, :user_id)
    end
end
