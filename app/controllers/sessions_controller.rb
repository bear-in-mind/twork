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
    @track = Track.find(params[:track_id])
    @session = Session.find(params[:id])
    @session.status = params[:session][:status][1]
    # @session.update(status_params)
    @session.save

    # raise
    # session = Session.find_by_id(session_id_params)
    # @session.update(status_params)
    # temp_path = track_params[:session][:track_id]
    redirect_to track_path(@track)
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
    params.require(:session).permit(:status)[1]
  end

  # def track_id_params
  #   params.require(:session).permit(:track_id)
  # end

  # def session_id_params
  #   params.require(:session).permit(:id)
  # end
  # def track_params
  #   params.require(:track).permit(:track_id)
  # end
end
