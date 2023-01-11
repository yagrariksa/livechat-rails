class MessagesController < ApplicationController
    def index
        @message = Message.new
        @messages = Message.all
    end

    def create
        @message = Message.new(params[:message].permit!)
        if @message.save
          flash[:success] = "Message successfully created"
        else
          flash[:error] = "Something went wrong"
        end
        redirect_to messages_path
    end
    

    private
    def message_params
        params.require(:message).permit(:body)
    end
end
