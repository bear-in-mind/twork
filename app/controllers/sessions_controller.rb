class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    @track = Track.find(params[:track_id])
    @session.track = @track # Supposes that session routes are nested in tracks
    if @session.save
      redirect_to track_path(@track)
    else
      redirect_to track_path(@track) # User doesn't get any error msg
    end
  end

  def update

    @track = Track.find(params[:track_id])
    @session = Session.find(params[:id])
    @session.update(session_status_params)
    redirect_to track_path(@track)
  end

  def destroy
    @session = Session.find(:id)
    @session.destroy
  end

  private

  def session_params
    params.require(:session).permit(:talent_id)
  end

  def session_status_params
    params.require(:session).permit(:status)
  end
end
