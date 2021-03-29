class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show,:destroy,:edit, :update]
  def index
    @profiles = current_user.profiles.all
  end

  def show
    @appointments = @profile.appointments.order("date", "time")
    @notes = @profile.notes.all.order("created_at")
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profiles_path
    else
      render :edit
    end
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      age = Date.today.year - @profile.dob.year
      @profile.update(age: age)
      redirect_to @profile
    else
      render :new
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :age, :dob, :language, :sex, :phone, :street,
                                      :city, :state, :zip, :user_id)
    end
end
