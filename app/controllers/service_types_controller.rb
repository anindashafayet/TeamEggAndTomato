class ServiceTypesController < ApplicationController
	def show
	@service_type = ServiceType.find(params[:id])
	end

	def new
	@service_type = ServiceType.new
	end
  
	def create
		@service_type = ServiceType.new(service_type_params)
		
		if @service_type.save
		  redirect_to @service_type
		else
		  render 'new'
		end
	end
	
	def destroy
		@service_type = ServiceType.find(params[:id])
		@service_type.destroy
		
	end
	
	private
	def service_type_params
		params.require(:service_type).permit(:name, :description)
	end
	
end
