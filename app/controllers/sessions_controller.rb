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
    # @session = Session.find(:id)
    # temp_session = params[:session][:status][0]
    # @session.content = temp_session
    @track = Track.find(params[:track_id])
    @session = Session.find(params[:id])
<<<<<<< HEAD
    @session.update(session_status_params)
=======
    @session.status = params[:session][:status][1]
    # @session.update(status_params)
    @session.save

    # raise
    # session = Session.find_by_id(session_id_params)
    # @session.update(status_params)
    # temp_path = track_params[:session][:track_id]
>>>>>>> parent of a6b2b94... Completed status update, pending: integration in latest version of controller
    redirect_to track_path(@track)
  end

  def destroy
    @session = Session.find(:id)
    @session.destroy
  end

  private

  def session_params
<<<<<<< HEAD
    params.require(:session).permit(:talent_id)
=======
    params.require(:session).permit(:talent)
  end

  def status_params
    params.require(:session).permit(:status)[1]
>>>>>>> parent of a6b2b94... Completed status update, pending: integration in latest version of controller
  end

  def session_status_params
    params.require(:session).permit(:status)
  end
end
