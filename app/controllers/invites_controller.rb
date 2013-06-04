class InvitesController < ApplicationController
before_filter :get_notebook
respond_to :html, :xml, :json

	def new
	end

	def create
		@invite = Invite.new(params[:invite])
		@invite.notebook_id = @notebook.id
		@invite.save
		UserMailer.send_invite(@invite.email, @notebook.title, current_user ).deliver
		respond_with(@notebook, @invite, :location => notebook_path(@notebook))
	end

	private
		def get_notebook
			@notebook = Notebook.find(params[:notebook_id])
		end


end