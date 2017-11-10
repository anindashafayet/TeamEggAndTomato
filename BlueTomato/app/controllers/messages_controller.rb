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
        if auth_user()
          #render plain: params[:message].inspect
          #@cid = params[:page_id]
          @message = Message.new(message_params)
          #@message.client_request = ClientRequest.find(@cid)
          @message.account = current_user()

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

        if @message.update(message_params)
            redirect_to @message
        else
            render 'edit'
        end
    end

    def destroy

      @message = Message.find(params[:id])
      @message.destroy
      redirect_back(fallback_location: root_path)
      #redirect_to request.referrer, notice: "You're being redirected"
    end

private
    def message_params
        params.require(:message).permit(:name, :email, :title, :text, :ispublic, :client_request_id)
    end
end
