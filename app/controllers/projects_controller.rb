class ProjectsController < ApplicationController
  def index
    @my_projects_as_supplier = []
    @my_sessions = []

    @my_projects_as_owner = current_user.projects

    @my_talents = current_user.talents
    @my_talents.each do |talent|
      @my_sessions << talent.sessions
    end
    @my_sessions.flatten.each do |session|
      @my_projects_as_supplier << session.track.project
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.updated_at = Time.now
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    @project.updated_at = Time.now
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline)
  end
end
