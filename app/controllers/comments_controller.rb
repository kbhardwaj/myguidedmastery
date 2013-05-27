class CommentsController < ApplicationController
	load_and_authorize_resource
	respond_to :html, :xml, :json

	def create
		@notebook = Notebook.find(params[:notebook_id])
		@note = Note.find(params[:note_id])
		@comment = @note.comments.build(params[:comment])
		@comment.user_id = current_user.id
		@comment.save
		respond_with(@notebook, @note, @comment, :location => notebook_note_path(@notebook, @note))
	end

	def destroy
		@notebook = Notebook.find(params[:notebook_id])
		@note = Note.find(params[:note_id])
		@comment = @note.comments.find(params[:id])
		@comment.destroy
		respond_with(@notebook, @note, :location => notebook_note_path(@notebook, @note))
	end

end