class Api::V1::MessagesController < ApplicationController

    before_action :find_message, only: [:show, :destroy]

    def index
        @messages = Message.all
        render json: @messages
    end

    def show
        render json: @message
    end

    def create
        @message = Message.create(message_params)
        render json: @message
    end

    private

    def find_message
        @message = Message.find(params[:id])
    end

    def message_params
        params.require(:message).permit(:content, :creator, comments: [:content, :creator, :message_id])
    end

end
