class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :create, :edit, :update]

  def show
    @sessions = @track.sessions.includes(:audio_files)
    @project = @track.project
    @owner = @project.project_owner
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    @track.project = @project
    if @track.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @track.update(track_params)
      @track.updated_at = Time.now
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @track.destroy
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:name)
  end
end
