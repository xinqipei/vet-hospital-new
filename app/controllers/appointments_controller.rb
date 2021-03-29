class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]
  before_action :set_pet
  # before_action :set_profiles, only: [:new, :create]

  def index
    @appointments = Appointment.where(pet_id: params[:pet_id])
    # @appointments = @pet.appointment
  end

  def show
    @profile = @appointment.profile.find(params[:id])
    @pet = @appointment.pet.find(params[:pet_id])
  end

  def new
    @appointment = @pet.appointments.new
  end

  def create
    @appointment = @pet.appointments.new(appointment_params)
    if @appointment.save
      redirect_to pet_appointments_path
    else

      flash[:errors] = @appointment.errors.messages[:status]
      render :new
    end
  end

  def destroy
    @pet.appointments.find(params[:id]).destroy
    redirect_to pet_appointments_path
  end

  private
    def set_pet
      @pet = Pet.find(params[:pet_id])
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def set_profiles
      @profiles = (Profile.all.order("last_name") - @pet.profiles)
    end

    def appointment_params
      params.require(:appointment).permit(:profile_id, :date, :time)
    end
end
