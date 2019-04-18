class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	  include Pundit
  	   protect_from_forgery


	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	def user_not_authorized
		flash[:alert] = "You are not authorized to perform this action."
		redirect_to(request.referrer || root_path, data: { confirm_swal: 'Are you sure?' })


	end





	# before_action :configure_permitted_parameters, if: :devise_controller?

	# def configure_permitted_parameters
 #        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
 #        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
	# end   





	def after_sign_in_path_for(resource)
		# puts "$"*500
		# puts current_user.role
		case current_user.role
			when 'admin'    #compare to 0
				admin_path
			when 'teacher'    #compare to 1
				teacher_auth_home_path
			 # when 'punjab'    #compare to 2
			 #  punjab_auth_path
			 # when 'federal'    #compare to 3
			 # 	federal_auth_path
			
			else
			  puts "it was something else"
			  puts current_user.role
		end
	end
end
