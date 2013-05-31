class NotesController < ApplicationController
	load_and_authorize_resource :notebook
	load_and_authorize_resource :note, :through => :notebook
	respond_to :html, :xml, :json
	
	def new
		@notebook = Notebook.find(params[:notebook_id])
		@note = @notebook.notes.build
		respond_with(@note)
	end

	def create
		@notebook = Notebook.find(params[:notebook_id])
		@note = @notebook.notes.build(params[:note])
		@note.user_id = current_user.id
		flash[:notice] = 'Note was successfully created.' if @note.save
		respond_with(@notebook, @note, :location => notebook_path(@notebook))
	end

	def show
		@notebook = Notebook.find(params[:notebook_id])
		@note = @notebook.notes.find(params[:id])
	end

	def edit
		@notebook = Notebook.find(params[:notebook_id])
		@note = @notebook.notes.find(params[:id])
	end

	def update
	    @notebook = Notebook.find(params[:notebook_id])
	    @note = @notebook.notes.find(params[:id])
	    flash[:notice] = 'Note was successfully updated.' if @note.update_attributes(params[:note])
	    respond_with(@notebook, @note, :location => notebook_note_path(@notebook, @note))
	end

	def destroy
		@notebook = Notebook.find(params[:notebook_id])
		@note = @notebook.notes.find(params[:id])
		@note.destroy
		respond_with(@notebook, :location => notebook_path(@notebook))
	end
	def vote
		value = params[:type] == "up" ? 1 : -1
		@notebook = Notebook.find(params[:notebook_id])
		@note = @notebook.notes.find(params[:id])
		@note.add_or_update_evaluation(:votes, value, current_user)
		redirect_to :back, notice: "Thanks for voting!"
	end
	
end
