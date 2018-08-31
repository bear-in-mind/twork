class ProjectsController < ApplicationController
before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @project = Project.new
    @track = Track.new

    @my_projects_as_talent = []
    @my_projects_as_owner = []
    no_deadline = []
    with_deadline = []
    current_user.projects.each do |project|
      if project.deadline.nil?
        no_deadline << project
      else
        with_deadline << project
      end
    end
    @my_projects_as_owner = with_deadline.sort_by {|project| project.deadline} + no_deadline
    @my_sessions = []
    @my_tracks = []
    @my_talents = current_user.talents

    @my_talents.each do |talent|
      @my_sessions << talent.sessions
    end

    @my_sessions.flatten.each do |session|
      @my_projects_as_talent << session.track.project
      @my_tracks << session.track
    end

    @my_projects_as_talent_sorted = @my_projects_as_talent.sort_by {|project| project.deadline}
  end

  def show
    @track = Track.new
    @tracks = @project.tracks.includes(:talents, :sessions)
    @owner = @project.project_owner
    # @test_session = Session.find(21)
    # @test_audio_1 = AudioFile.find(2)
    # @test_audio_2 = AudioFile.find(1)
    # @array_test = [@test_audio_1, @test_audio_2]
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.updated_at = Time.now
    if @project.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      @project.updated_at = Time.now
      redirect_back(fallback_location: root_path)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :deadline)
  end
end
