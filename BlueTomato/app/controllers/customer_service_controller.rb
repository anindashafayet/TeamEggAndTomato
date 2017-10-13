class CustomerServiceController < ApplicationController
  def index
    @messages = Message.all
  end
  def submit_feedback
    render plain: params.inspect
  end
  def result

  end
end
