require "ice_cube"
include ActionView::Helpers::NumberHelper
class ClientRequestsController < ApplicationController
  def match_applicant
    @client_request = ClientRequest.find(params[:id])
    if @client_request.update_attribute("matched_user", params[:matched_id])
      @client_request.applicants.clear()
    end
    redirect_to client_request_path(@client_request)
  end

  def index
	@filterrific =  initialize_filterrific(ClientRequest,params[:filterrific],
		select_options: {
			sorted_by: ClientRequest.options_for_sorted_by,
			with_name: ServiceType.options_for_select
		},
	  persistence_id: 'shared_key',
      default_filter_params: {},
	) or return

	@client_requests = @filterrific.find.page(params[:page])

	respond_to do |format|
		format.html
		format.js
	end
	rescue ActiveRecord::RecordNotFound => e
	# There is an issue with the persisted param_set. Reset it.
	puts "Had to reset filterrific params: #{ e.message }"
	redirect_to(reset_filterrific_url(format: :html)) and return
  end

  def new
    require_logged_in()
    @client_request = ClientRequest.new
  end
  # An IceCube rule(period_detail) and a start date (period) is used to denote the days that an offering or request are
  # available.
  # return [{offering: teen_offering, occur_date: date}], offerings that match the given client_request
  def match_offerings(client_request)
    def occurrences(event)
      if event.rule.nil?
        [event.period]
      else
        schedule = IceCube::Schedule.new([event.period, Time.now.beginning_of_day].max)
        schedule.add_recurrence_rule event.rule
        schedule.occurrences([event.period, Time.now.beginning_of_day].max + 1.year)
      end
    end
    def match_occurrences(base, matcher)
      matcher_occurrence = occurrences(matcher)
      schedule = IceCube::Schedule.new([base.period, Time.now.beginning_of_day].max)
      unless base.rule.nil?
        schedule.add_recurrence_rule base.rule
      end
      for occur_time in matcher_occurrence
        if schedule.occurs_on? occur_time.to_date
          return {offering: matcher, occur_date: occur_time.to_date}
        end
      end
      nil
    end
    offerings = TeenOffering.where(service_type_id: client_request.service_type_id)
    matched = []
    for offering in offerings
      matched_occurrences = match_occurrences(client_request, offering)
      unless matched_occurrences.nil?
        matched << matched_occurrences
      end
    end
    matched
  end

  def show
    @client_request = ClientRequest.find(params[:id])
    @matched_offerings = match_offerings(@client_request)
    @message = Message.new()
    @messages = @client_request.messages
    if @client_request.matched_user?
      @matched_user = User.find(@client_request.matched_user)
    end
    if session[:user_id]
      @username = logged_in_user_or_guest().username
    else
      @username = "Please log in first."
    end
    @applicants = @client_request.applicants.where.not(:id=>nil)
  end

  def edit
    @client_request = ClientRequest.find(params[:id])
    @address = Address.find(@client_request.address_id)
  end

  def destroy
    @client_request = ClientRequest.find(params[:id])
    @client_request.destroy

    redirect_to client_requests_path
  end

  def update
    @client_request = ClientRequest.find(params[:id])
    @address = Address.find(@client_request.address_id)

    if @address.update(address_params) && @client_request.update(client_request_params)
      @client_request.city = @address.city
      @client_request.save()
      redirect_to @client_request
    else
      render 'edit'
    end
  end

  def update_progress
    @client_request = ClientRequest.find(params[:id])
    if @client_request
      @client_request.progress = params[:client_request][:progress].to_i
      @client_request.fullfillment = params[:client_request][:fullfillment]
      if !@client_request.save()
        logger.debug @client_request
      end
    end
    redirect_back(:fallback_location=>root_path)
  end

  def update_rating
    @client_request = ClientRequest.find(params[:id])
    if @client_request
      @matched_user = User.find(@client_request.matched_user)
      @client_request.rating = params[:client_request][:rating].to_i
      @client_request.feedback = params[:client_request][:feedback]
      if @client_request.save()
        count = @matched_user.rating_count || 0
        @matched_user.rating ||= 0
        @matched_user.rating = (@matched_user.rating * count + @client_request.rating)/(count+1)
        @matched_user.rating_count = count+1
        if !@matched_user.save()
            @client_request.rating=0
            @client_request.feedback=""
            @client_request.save()
        end
      end
    end
    redirect_back(:fallback_location=>root_path)
  end

  def auto_match
    @client_request = ClientRequest.find(params[:id]) #.where("city=? or city=nil",@client_request.city).
    @matched_user = User.joins("INNER JOIN client_requests \
      ON client_requests.matched_user = users.id").
        where("(users.city IS ? or users.city = ?) AND users.id != ? AND client_requests.period != ?",
        nil, @client_request.city, @client_request.user_id, @client_request.period.to_s).first

    if !@matched_user
      flash[:error] = "Cannot find any potential user to match! Please wait for applicants or try again later."
      redirect_to @client_request
    else
      _match_applicant(@client_request, @matched_user.id)
      #post_to match_path(@client_request, @matched_user)
    end


  end

  def create
    if require_logged_in()
      @client_request = ClientRequest.new(client_request_params)
      @address = Address.new(address_params)
      @client_request.user_id = logged_in_user_or_guest.id
      if @address.save
        @client_request.address_id = @address.id
        if @client_request.save
  		    #@address=@client_request.build_address(address_params).save
      	  #leave these on for filterrific
      	  @client_request.city = @address.city
      	  @client_request.service_name = ServiceType.find(@client_request.service_type_id).name
      	  #leave these on for filterrific
          if @client_request.save
            redirect_to @client_request
          else
            @client_request.delete
            @address.delete
            render 'new'
          end
        else
          @address.delete
          render 'new'
        end
      else
        render 'new'
      end
    end
  end

  private
  def client_request_params
    params.require(:client_request).permit(:service_type_id, :title, :period, :detail, :period_detail)
  end
  def address_params
    params.require(:client_request).permit(:state, :city, :zip)
  end
  def _match_applicant(client_request, matched_id)
    #@client_request = ClientRequest.find(params[:id])
    if client_request.update_attribute("matched_user", matched_id)
      client_request.applicants.clear()
    end
    redirect_to client_request_path(client_request)
  end

end
