class ServiceTypesController < ApplicationController
  def show
    @service_type = ServiceType.find(params[:id])
  end
end
