class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @notes = current_user.notes
  end

  def show
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)
    @note.complete = false if @note.complete.nil?
    if @note.save
      redirect_to notes_path, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to notes_path, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :complete, :time)
  end
end
