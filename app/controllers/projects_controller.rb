class ProjectsController < ApplicationController
before_action :set_project, only: [:show, :edit, :update]
  def index
    @my_projects_as_talent = []
    @my_projects_as_owner = current_user.projects
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
  end

  def show
    @owner = @project.project_owner
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.updated_at = Time.now
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      @project.updated_at = Time.now
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :deadline)
  end
end
