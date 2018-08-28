class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:index, :new, :create, :edit, :update]

  def index
    @tracks = @project.tracks
  end

  def show; end

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
    authorize @project
  end

  def set_track
    @track = Track.find(params[:id])
    authorize @track
  end

  def track_params
    params.require(:track).permit(:name)
  end
end
