class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :create]

  def show
    @sessions = @track.sessions.includes(:audio_files)
    @project = @track.project
    @owner = @project.project_owner
    @audio_file = AudioFile.new
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    @track.project = @project
    if @track.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end



  def update
    if params[:track][:brief].present?
      @track.update(brief_params)
      @track.updated_at = Time.now
      # raise
      redirect_to track_path(@track)
    else
      # Is this used anywhere ?
      if @track.update(track_params)
        @track.updated_at = Time.now
        redirect_to project_path(@project)
      else
        render :edit
      end
      # End of possibly useless code
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

  def brief_params
    params.require(:track).permit(:brief)
  end
end
