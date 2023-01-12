class MessagesController < ApplicationController
    def index
        @message = Message.new
        @messages = Message.all.order(created_at: :asc)
        @current_user = session[:current_name]
        if !session[:current_pc]
            session[:current_pc] = rand()
        end
        @current_pc = session[:current_pc]
    end

    def create
        @message = Message.create(body: message_params[:body], sender: session[:current_name], pc: session[:current_pc])
    end

    def setName
        session[:current_name] = params[:current_user]
        redirect_to messages_path
    end

    def clearChat
        Message.delete_all
        redirect_to root_path

    end

    private
    def message_params
        params.require(:message).permit(:body)
    end
end
