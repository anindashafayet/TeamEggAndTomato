class TeenagersController < ApplicationController
	attr_accessor :teenager, :account
  def new
  	@teenager=Teenager.new
  	@teenager.build_account
  	@teenager.build_address
  	
  end
  def create
  	@teenager=Teenager.create(params_teenager)
  	@account=@teenager.build_account(params_account).save
  	@address=@teenager.build_address(params_address).save
  	# @address=@teenager.address
  	#@account=Account.new
  	# @teenager.save
  	#redirect_to root
  	render plain:  params_teenager.inspect + "\n" +params[:teenager].inspect + "\n" + 
  	params_address.inspect + #@teenager.fname.inspect + @address.line1.inspect #params[:teenager].inspect
  	@account.inspect
  end

  private

  def params_teenager
  	params.require(:teenager).
  	permit(:fname, :lname, :birth_date, :cell_phone)
  end	
  def params_address
  	params.require(:teenager).require(:address_attributes).
  	permit(:line1, :line2, :city, :state, :zip)
  end	
  def params_account
  	params.require(:teenager).require(:account_attributes).
  	permit(:username, :password)
  end	
end
