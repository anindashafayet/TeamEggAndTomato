class MessagesController < ApplicationController

    def show
        @message = Message.find(params[:id])
    end

    def new
        @message = Message.new
    end

    def edit
        @message = Message.find(params[:id])
    end

    def create
        if require_logged_in()
          #render plain: params[:message].inspect
          #@cid = params[:page_id]
          @message = Message.new(message_params)
          #@message.client_request = ClientRequest.find(@cid)
          @message.user = logged_in_user_or_guest()

          if @message.save
              #redirect_to @message
              respond_to do |format|
                  format.js {render 'insert'}
              end
          else
              respond_to do |format|
                  format.js
              end
              #render '/customer_service/index'
          end

        end
    end

    def update
        @message = Message.find(params[:id])
        if logged_in_user_or_guest.id == @message.user_id || logged_in_user_or_guest.username == "admin"

          if @message.update(message_params)
              redirect_to @message
          else
              render 'edit'
          end
        else
          @message.errors.add(:base, :invalid, message: "Not creater of message.")
          redirect_to @message
        end
    end

    def destroy
      @message = Message.find(params[:id])
      if logged_in_user_or_guest.id == @message.user_id || logged_in_user_or_guest.username == "admin"
        @message.destroy
        if !params[:prevPage].include?("show") && !params[:prevPage].include?("edit")
          redirect_to params[:prevPage]
        else
          redirect_to :root
        end
      end
    end

private
    def message_params
        params.require(:message).permit(:name, :email, :title, :text, :ispublic, :client_request_id)
    end
end
