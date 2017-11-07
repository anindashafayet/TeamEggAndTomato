class TeenOfferingsController < ApplicationController
  def index
    @teen_offerings = TeenOffering.all
  end

  def new
    @teen_offering = TeenOffering.new
  end

  # An IceCube rule(period_detail) and a start date (period) is used to denote the days that an offering or request are
  # available.
  # Return [{request: client_request, occur_date: date}], requests that match the given teen_offering.
  def match_requests(teen_offering)
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
          return {request: matcher, occur_date: occur_time.to_date}
        end
      end
      nil
    end

    requests = ClientRequest.where(service_type_id: teen_offering.service_type_id)
    matched = []
    for request in requests
      matched_occurrences = match_occurrences(teen_offering, request)
      unless matched_occurrences.nil?
        matched << matched_occurrences
      end
    end
    matched
  end

  def show
	  if auth_user
		@teen_offering = TeenOffering.find(params[:id])
		@matched_requests = match_requests(@teen_offering)
	  else
	   
	  end
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
    params.require(:teen_offering).permit(:service_type_id, :period, :detail, :period_detail)
  end
end
