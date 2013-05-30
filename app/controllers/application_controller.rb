class ApplicationController < ActionController::Base
  after_filter :store_location
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
	flash[:notice] = exception.message
	redirect_to notebooks_path
  end


	def store_location
	  # store last url as long as it isn't a /users path
	  session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
	end

	def after_sign_in_path_for(resource)
	  session[:previous_url] || root_path
	end
end
