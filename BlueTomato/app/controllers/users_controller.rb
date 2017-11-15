# Users controller for account creation, sign_in, session, etc.
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_create_params)
    if @user.valid?
      login_session(@user.id)
    else
      render 'new' # TODO: Add error messages and repopulate form
    end
  end

  private

  def user_create_params
    params.require(:user)
          .permit(:username, :email, :password, :fname, :lname, :phone)
  end
end
