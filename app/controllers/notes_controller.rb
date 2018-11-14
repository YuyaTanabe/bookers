class NotesController < ApplicationController
  def index  	
    @notes = Note.all
    @note = Note.new
  end

  def new
  	
  end

  def create
	@note = Note.new(note_params)
	if @note.save
	  redirect_to @note, notice: "Book was successfully created."
    else
      @notes = Note.all
      render "index"
    end
  end

  def show
  	@note = Note.find(params[:id])
  end

  def edit
  	@note = Note.find(params[:id])
  end

  def update
	@note = Note.find(params[:id])
	if @note.update(note_params)
	  redirect_to @note, notice: "Book was successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    note = Note.find(params[:id])
    if note.destroy
      redirect_to notes_path, notice: "Book was successfully destroyed."
    else
      render "show"
    end
  end


  private

  def note_params
    params.require(:note).permit(:title, :body)
  end


end
