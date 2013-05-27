class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
	flash[:notice] = exception.message
	redirect_to notebooks_path
  end
end
