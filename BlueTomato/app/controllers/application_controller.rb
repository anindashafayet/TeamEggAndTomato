class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def auth_user
  	if session[:user_id]
  		@current_user=Account.find session[:user_id]
  		return true
  	else
  		redirect_to '/home/login' and return false
  	end
	end

  def current_user
    if session[:user_id]
      return Account.find(session[:user_id])
    else
      return Account.new()
    end
	end

	helper_method :current_user, :auth_user
	include SessionsHelper
end
