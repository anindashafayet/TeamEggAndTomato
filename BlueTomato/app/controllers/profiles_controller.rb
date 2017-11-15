class ProfilesController < ApplicationController
  def new

  end
  
  def index
    
  end

  def create
    #we need to find whether this profile linked to the account infomation
    @profile = Profile.new(profile_params)
    @profile.save
    redirect_to @profile
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private
  def profile_params
    params.require(:profile).permit(:description, :phone , :address)
  end

end
