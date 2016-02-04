class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper


  before_action :configure_permitted_parameters, if: :devise_controller?


		def must_be_admin
			unless current_user && current_user.admin?
				redirect_to root_path, notice: "You're not admin, you do not have this privilages :(!"
			end
		end

  protected

	  def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << :username
		devise_parameter_sanitizer.for(:account_update) << :username
	  end

end
