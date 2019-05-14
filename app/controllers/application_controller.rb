class ApplicationController < ActionController::Base

  # before_action :set_cache_headers

  before_action :authenticate_user!
  include Pundit
  protect_from_forgery


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  # def set_cache_headers
  #   response.headers["Cache-Control"] = "no-cache, no-store"
  #   response.headers["Pragma"] = "no-cache"
  #   response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  # end

  def user_not_authorized

    #	flash[:notice] = "You are not authorized to perform this action"
    # byebug
    #
    if !Board.all.any?
      flash[:notice] = "You are not authorized ,create board firstly"
      redirect_to new_board_path
    elsif !Group.all.any?
      flash[:notice] = "You are not authorized to perform this action create Class firstly"
      redirect_to new_group_path
    elsif !Course.all.any?
      flash[:notice] = "You are not authorized to perform this action create Course firstly"
      redirect_to new_course_path
    end
    # unless Group.all.any?
    # 	flash[:notice] = "You are not authorized to perform this action create Class firstly"
    # end
    # unless Course.all.any?
    # 	flash[:notice] = "You are not authorized to perform this action create Course firstly"
    # end

    #redirect_to(request.referrer || root_path)


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
    when 'admin' #compare to 0
      admin_path
    when 'teacher' #compare to 1
      teacher_auth_home_path
    when 'proof_reader' #compare to 2
      proof_reader_home_path
      when 'student'    #compare to 3
        student_auth_home_path

    else
      puts "it was something else"
      puts current_user.role
    end
  end
end
