class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = logged_in_user.profile.create_address(address_params)
    if @address.valid?
      redirect_to profile_path(logged_in_user.profile)
    else
      render 'new'
    end
  end

  def edit
    @address = logged_in_user.profile.address
    render 'new'
  end

  def update
    logged_in_user.profile.address.update(address_params)
    redirect_to profile_path(logged_in_user.profile)
  end

  private

  def address_params
    params.require(:address).permit(:line1, :line2, :city, :state, :zip)
  end
end
