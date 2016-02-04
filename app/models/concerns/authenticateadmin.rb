module AuthenticateAdminHelper
	extend ActiveSupport::Concern

	def must_be_admin
		unless current_user && current_user.admin?
			redirect_to root_path, notice: "You're not admin, you do not have this privilages :(!"
			end
		end
end
