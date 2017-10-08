class TeenagersController < ApplicationController
	attr_accessor :teenager, :account
  def new
  	@teenager=Teenager.new
  	@teenager.build_account
  	@teenager.build_address
  end
  def create
  	@teenager=Teenager.new(params[:fname]) 	
  	#@account=Account.new
  	# @teenager.save
  	#redirect_to root
  	render plain: params[:teenager].inspect
  end

  private

  def params_post
  	params.require(:fname).permit(:string, :text)
  end	
end
