# Users controller for account creation, sign_in, session, etc.
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_create_params)
    if @user.valid?
      redirect_to login_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all()
  end

  def destroy
    if logged_in_user_or_guest.username == "admin"
      @user = User.find(params[:id])
      @user.destroy
      redirect_to "/users"
    end
  end

  private

  def user_create_params
    params.require(:user)
          .permit(:username, :email, :password, :fname, :lname, :phone, :city)
  end
end
