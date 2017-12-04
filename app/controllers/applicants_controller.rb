class ApplicantsController < ApplicationController
  def new
    @applicant = Applicant.new()
  end
  def create
    if require_logged_in()
      @client_request = ClientRequest.find(params[:client_request_id])
      if @client_request.user_id == logged_in_user_or_guest().id
          @applicant = Applicant.new()
          @applicant.errors.add(:base, :invalid, message:"Cannot apply as request owner.")
          flash[:error] = "Cannot apply as request owner."
      elsif !@client_request.applicants.exists?(user_id: logged_in_user_or_guest().id)
          @applicant = @client_request.applicants.create({user_id: logged_in_user_or_guest().id, \
              client_request_id:params[:client_request_id]})
          config.logger = Logger.new(STDOUT)
          @applicant.save()
      else
        flash[:error] = "Already applied. Cannot apply twice."
      end
      redirect_to client_request_path(@client_request)
    end
  end
private
  def applicant_param
    params.require(:applicant)
  end
end
