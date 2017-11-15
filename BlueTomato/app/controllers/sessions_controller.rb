# Sessions class to control login/logout operations
class SessionsController < ApplicationController

  def new; end

  def create
    @user = User.find_by_username(login_params[:username])
    # TODO: Add password hashing or third-party library
    if !@user.nil? && @user.password == login_params[:password]
      log_in(@user)
      redirect_to '/home/profile'
    else
      render 'new'
    end
  end

  def destroy
    log_out
  end

  private

  def login_params
    params.require(:login_data)
          .permit(:username, :password)
  end

  def log_in(user)
    session[:user_id] = user.id
  rescue ActiveRecord::RecordNotFound
    raise ArgumentError, 'user_id not present in database'
  end

  def log_out
    session.delete(:user_id)
  end
end
