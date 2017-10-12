class TeenOfferingsController < ApplicationController
  def index
    @teen_offerings = TeenOffering.all
  end

  def new
    @teen_offering = TeenOffering.new
  end

  def show
    @teen_offering = TeenOffering.find(params[:id])
  end

  def edit
    @teen_offering = TeenOffering.find(params[:id])
  end

  def destroy
    @teen_offering = TeenOffering.find(params[:id])
    @teen_offering.destroy

    redirect_to teen_offerings_path
  end

  def update
    @teen_offering = TeenOffering.find(params[:id])

    if @teen_offering.update(teen_offering_params)
      redirect_to @teen_offering
    else
      render 'edit'
    end
  end

  def create
    @teen_offering = TeenOffering.new(teen_offering_params)

    if @teen_offering.save
      redirect_to @teen_offering
    else
      render 'new'
    end
  end

  private
  def teen_offering_params
    params.require(:teen_offering).permit(:service_type_id, :period, :detail)
  end
end
