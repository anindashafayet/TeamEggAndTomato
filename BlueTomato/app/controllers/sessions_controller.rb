class SessionsController < ApplicationController

  def new
  end

  def create
	account = Account.find_by(username: params[:session][:username].downcase)
	if account
		log_in account
		redirect_to teen_offerings_url
	else
		render 'new'
	end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
