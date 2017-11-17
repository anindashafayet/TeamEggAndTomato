class ProfilesController < ApplicationController
  def show
    # This will raise if no user is logged in, but it shouldn't be called
    # if no user is logged in (there are no links for it in the page)
    @user = logged_in_user
  end

  def new
    @profile = Profile.new
  end

  def create
    profile = logged_in_user.create_profile(profile_params)
    if profile.valid?
      redirect_to profile_path(profile)
    else
      redirect_to new_profile_path
    end
  end

  def edit
    @profile = logged_in_user.profile
    render 'new'
  end

  def update
    logged_in_user.profile.update(profile_params)
    redirect_to profile_path(logged_in_user.profile)
  end

  private

  def profile_params
    params.require(:profile).permit(:date_of_birth, :about_me, :phone, :gender)
  end
end
