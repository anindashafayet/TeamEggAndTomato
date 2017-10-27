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
        #render plain: params[:message].inspect

        @message = Message.new(message_params)
   
        if @message.save
            redirect_to @message
        else
            render 'new'
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
        
      redirect_to "/customer_service/index"
    end

private
    def message_params
        params.require(:message).permit(:name, :email, :title, :text)
    end
end