class MessagesController < ApplicationController
    def index
        @message = Message.new
        @messages = Message.all
    end

    def create
        @message = Message.create(body: message_params[:body])
    end
    

    private
    def message_params
        params.require(:message).permit(:body)
    end
end
