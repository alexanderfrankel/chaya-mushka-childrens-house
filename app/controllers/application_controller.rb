class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authorize_admin!
  	require_signin!

  	if current_user.nil? == false
	  	unless current_user.admin?
	  		flash[:alert] = "You must be an admin to do that."
	  		redirect_to root_path
	  	end
	  end
  end

  def authorize_faculty!
  	require_signin!

  	if current_user.nil? == false
  		unless current_user.faculty?
  			flash[:alert] = "You must be faculty to do that."
  			redirect_to root_path
  		end
  	end
  end

  def require_signin!
  	if current_user.nil?
  		flash[:error] = "You need to sign in before continuing."
  		redirect_to signin_url
  	end
  end
  helper_method :require_signin!

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
