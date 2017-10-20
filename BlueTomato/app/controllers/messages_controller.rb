class MessagesController < ApplicationController

    def show
        @message = Message.find(params[:id])
    end

    def new

    end
    def create
        #render plain: params[:message].inspect

        @message = Message.new(message_params)
   
        @message.save
        redirect_to @message
    end

    private
        def message_params
            params.require(:message).permit(:name, :email, :title, :text)
        end
end
