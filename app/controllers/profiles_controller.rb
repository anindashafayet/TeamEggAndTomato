class ProfilesController < ApplicationController
  def show
    # should allow other to view the page
    # @profile = Profile.find(params[:id])
    @profile_user = User.find(params[:id])
	  @transactions = Transaction.all
    @client_requests = ClientRequest.where(user_id: @profile_user.id)
                           .or(ClientRequest.where(matched_user: @profile_user.id))
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = logged_in_user.create_profile(profile_params)
    if @profile.valid?
      redirect_to profile_path(@profile)
    else
      render 'new'
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
    params.require(:profile).permit(:date_of_birth, :about_me, :phone, :gender, :image)
  end
end
