class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def auth_user
  	if session[:user_id]
  		@current_user=Account.find session[:user_id]
  		return true
  	else 
  		redirect_to '/teenagers/sign_in' and return false
  	end
  end
end
