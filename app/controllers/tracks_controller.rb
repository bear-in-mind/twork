class TracksController < ApplicationController
  before_action :set_track, only: [:show, :update, :destroy]
  before_action :set_project, only: :create

  def show
    #project details
    @project = @track.project
    @owner = @project.project_owner

    # session index
    @sessions = @track.sessions.includes(:audio_files)

    # create session
    @session = Session.new
    @talents = Talent.all
    @talents_name = User.all.map do |user|
      "#{user.first_name.capitalize} #{user.last_name.upcase}"
    end
    @talents_id = Talent.all.map do |talent|
      talent.id
    end

    # create audio file
    @audio_file = AudioFile.new
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
    if @track.update(track_params)
      @track.updated_at = Time.now
      redirect_back(fallback_location: project_path(@track.project))
    else
      render :edit
    end
  end

  def destroy
    @track.destroy
    redirect_back(fallback_location: project_path(@track.project))
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:name, :brief)
  end
end
