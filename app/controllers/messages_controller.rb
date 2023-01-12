class MessagesController < ApplicationController
    def index
        @message = Message.new
        @messages = Message.all.order(created_at: :asc)
    end

    def create
        @message = Message.create(body: message_params[:body])
    end
    

    private
    def message_params
        params.require(:message).permit(:body)
    end
end
