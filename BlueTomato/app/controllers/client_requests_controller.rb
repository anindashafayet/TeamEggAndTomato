require "ice_cube"

class ClientRequestsController < ApplicationController
  def index
    @client_requests = ClientRequest.all
  end

  def new
    @client_request = ClientRequest.new
  end

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
    params.require(:client_request).permit(:service_type_id, :period, :detail, :period_detail)
  end
end
