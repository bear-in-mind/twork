class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.track = params[:id] #à vérifier
    if @message.save
      redirect_to track_path(@message.track) #à vérifier
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(:id)
    @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
