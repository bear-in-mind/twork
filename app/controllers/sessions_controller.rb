class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    @session.track = Track.find(params[:id])
    if @session.save
      redirect_to track_path(?)
    else
      render :new
    end
  end

  def destroy
    @session = Session.find(:id)
    @session.destroy
  end

  private

  def session_params
    params.require(:session).permit(:talent)
  end
end
