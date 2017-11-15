class TeenagersController < ApplicationController
	attr_accessor :teenager, :account
  def new
  	@teenager=Teenager.new
  	@teenager.build_account
  	@teenager.build_address
	@teenager.build_profile
  	
  end
  def create
  	@teenager=Teenager.create(params_teenager)
  	#@account=@teenager.build_account(params_account).save
	if @teenager.build_account(params_account).save
		@address=@teenager.build_address(params_address).save
		@profile=@teenager.build_profile.save
		# @address=@teenager.address
		#@account=Account.new
		# @teenager.save
		#redirect_to root
		render plain:  params_teenager.inspect + "\n" +params[:teenager].inspect + "\n" + 
		params_address.inspect + #@teenager.fname.inspect + @address.line1.inspect #params[:teenager].inspect
		@account.inspect
	else
		@teenager.destroy
		render 'new'
	end
  end

  def sign_in
    render "sign_in"
  end

  def verify
    #render plain: params.inspect
    @account=Account.select('*').where(accountable_type: 'Teenager', username: params_account_sign_in[:username],
     password: params_account_sign_in[:password])
    #render plain: @account.inspect
    if @account.first!=nil
      #@teenager=Teenager.find(0)
      session[:user_id]=@account.first.id
      if auth_user
        redirect_to "/home/home"
      end
    else
      flash[:notice] = 'wrong username/password'
      redirect_to '/teenagers/sign_in' and return false
    end
  end

        
  private
  def params_profile
    params.require(:profile)
	permit(:address)
  end
  def params_teenager
  	params.require(:teenager).
  	permit(:fname, :lname, :birth_date, :cell_phone)
  end	
  def params_address
  	params.require(:teenager).require(:address).
  	permit(:line1, :line2, :city, :state, :zip)
  end	
  def params_account
  	params.require(:teenager).require(:account).
  	permit(:username, :password)
  end	
  def params_account_sign_in
    params.require(:account).
    permit(:username, :password)
  end 
end
