class TeenagersController < ApplicationController
  def new
  end
  def create
  	#@teenager=Teenager.new(params)
  	# @teenager.save
  	#redirect_to root
  	render plain: params[:teenager].inspect
  end

  private

  def params_post
  	params.require(:fname).permit(:title, :text)
  end	
end
