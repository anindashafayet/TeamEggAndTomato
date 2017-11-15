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
      guest = Account.new()
      guest.username = "Guest"
      return guest
    end
  end

  def logged_in_user
    User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    nil
  end

  # TODO: I feel like these should be here, but when I tried to put them in
  # TODO: the helpers I get problems with 'session'
  def session_nav_element_label
    user = logged_in_user
    if !user.nil?
      user.fname
    else
      'Login'
    end
  end

  def session_nav_element_link
    if !logged_in_user.nil?
      profile_path
    else
      login_path
    end
  end

  helper_method :current_user, :auth_user
  helper_method :session_nav_element_label
  helper_method :session_nav_element_link
end
