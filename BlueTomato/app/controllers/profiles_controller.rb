class ProfilesController < ApplicationController
  def new; end

  def index; end

  def create
    # we need to find whether this profile linked to the account infomation
    @profile = Profile.new(profile_params)
    @profile.save
    redirect_to @profile
  end

  def show
    # TODO: Modify to actually show a Profile
    @user = logged_in_user if logged_in?
  end

  private

  def profile_params
    params.require(:profile).permit(:description, :phone, :address)
  end
end
