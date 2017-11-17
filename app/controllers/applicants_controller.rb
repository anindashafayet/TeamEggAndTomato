class ApplicantsController < ApplicationController
  def new
    @applicant = Applicant.new()
  end
  def create
    if require_logged_in()
      @client_request = ClientRequest.find(params[:client_request_id])
      if !@client_request.applicants.exists?(account_id: logged_in_user_or_guest().id)
        @applicant = @client_request.applicants.create({account_id: logged_in_user_or_guest().id,
          client_request_id:params[:client_request_id]})
      end
      redirect_to client_request_path(@client_request)
    end
  end
private
  def applicant_param
    params.require(:applicant)
  end
end
