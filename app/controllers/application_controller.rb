class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_logged_in
    if logged_in?
      return true
    else
      redirect_to login_path and return false
    end
  end

  # TODO: I think we should manually handle the case of no user logged in,
  # TODO: as opposed to returning 'Guest'
  def logged_in_user_or_guest
    if logged_in?
      logged_in_user
    else
      guest = User.new
      guest.username = 'Guest'
      guest
    end
  end

  def logged_in?
    User.exists?(session[:user_id])
  end

  # It may raise ActiveRecord::RecordNotFound, call logged_in? first
  def logged_in_user
    User.find(session[:user_id])
  end

  # TODO: I feel like these shouldn't be here, but when I tried to put them in
  # TODO: the helpers I got problems with 'session'
  def session_nav_element_label
    if logged_in?
      logged_in_user.fname
    else
      'Login'
    end
  end

  def session_nav_element_link
    if logged_in?
      profile_path(logged_in_user)
    else
      login_path
    end
  end

  helper_method :logged_in?, :logged_in_user
  helper_method :require_logged_in, :logged_in_user_or_guest
  helper_method :session_nav_element_label
  helper_method :session_nav_element_link
end
