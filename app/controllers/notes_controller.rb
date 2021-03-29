class NotesController < ApplicationController

  before_action :set_note, only: [:edit, :update, :destroy]
  before_action :set_profile
  
  def index
    @notes = @profile.notes.order("created_at")
  end

  def new
    @note = @profile.notes.new
  end

  def show
  end

  def create
    @note = @profile.notes.new(note_params)
    @note.update(user_id: current_user.id)
    if @note.save
      redirect_to @profile
    else
      render :new
    end
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to @profile
  end

   private

    def set_note
      @note = Note.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    def note_params
      params.require(:note).permit(:message, :user_id)
    end
end

