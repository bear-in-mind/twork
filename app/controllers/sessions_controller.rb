class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    @session.track = Track.find(params[:id]) # Supposes that session routes are nested in tracks
    if @session.save
      redirect_to track_path(@session.track)
    else
      render :new
    end
  end

  def update
    # @session = Session.find(:id)
    # temp_session = params[:session][:status][0]
    # @session.content = temp_session
    session.update(params[:session][:status])
    temp_path = track_params[:session][:track_id]
    raise
    redirect_to track_path(params[:track_id])
  end

  def destroy
    @session = Session.find(:id)
    @session.destroy
  end

  private

  def session_params
    params.require(:session).permit(:talent)
  end

  def status_params
    params.require(:session).permit(:status)
  end

  # def track_params
  #   params.require(:track).permit(:track_id)
  # end
end
