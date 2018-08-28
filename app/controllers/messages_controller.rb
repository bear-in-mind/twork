class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @talent.user = current_user
    @message.content = Track.find(params[:id]) # Supposes that message routes are nested in tracks
    if @message.save
      redirect_to track_path(@message.track)
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
