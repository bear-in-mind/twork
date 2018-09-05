class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @talent = Talent.find_by(user_id: params[:session][:talent], skill_id: params[:skill_id])
    @session = Session.new(talent: @talent)
    @track = Track.find(params[:track_id])
    @session.track = @track # Supposes that session routes are nested in tracks
    if @session.save
      redirect_to track_path(@track)
    else
      redirect_to track_path(@track) # User doesn't get any error msg if it fails
    end
  end

  def update
    # raise
    # @track = Track.find(params[:track_id])
    @session = Session.find(params[:id])
    @track = @session.track
    @session.update(session_status_params)
    redirect_to track_path(@track)
  end

  def destroy
    @session = Session.find(params[:id])
    @track = @session.track
    @session.destroy

    redirect_to track_path(@track)

  end

  private

  def session_params
    params.require(:session).permit(:talent_id, :skill_id)
  end

  def session_status_params
    params.require(:session).permit(:status)
  end
end
