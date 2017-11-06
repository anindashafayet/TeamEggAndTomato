class CustomerServiceController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.where("ispublic = ?", true)
  end
  def submit_feedback
    render plain: params.inspect
  end
  def result

  end
end
