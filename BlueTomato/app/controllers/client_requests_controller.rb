class ClientRequestsController < ApplicationController
  def index
    @client_requests = ClientRequest.all
  end

  def new
    @client_request = ClientRequest.new
  end

  def show
    @client_request = ClientRequest.find(params[:id])
  end

  def edit
    @client_request = ClientRequest.find(params[:id])
  end

  def destroy
    @client_request = ClientRequest.find(params[:id])
    @client_request.destroy

    redirect_to client_requests_path
  end

  def update
    @client_request = ClientRequest.find(params[:id])

    if @client_request.update(client_request_params)
      redirect_to @client_request
    else
      render 'edit'
    end
  end

  def create
    @client_request = ClientRequest.new(client_request_params)

    if @client_request.save
      redirect_to @client_request
    else
      render 'new'
    end
  end

  private
  def client_request_params
    params.require(:client_request).permit(:service_type_id, :period, :detail)
  end
end
