class TracksController < ApplicationController

  before_action :set_track, only: [:show, :update, :destroy]
  before_action :set_project, only: :create

  def show

    #project details
    @project = @track.project
    @owner = @project.project_owner

    # session index
    @sessions = @track.sessions.includes(:audio_files).order(created_at: :desc)

    # create session
    @session = Session.new

    #create a hash with all users and their corresponding skills
    @talents_hash = {}
    User.all.each do |user|
      @talents_hash[user.id] = user.skills.pluck(:name, :id)
    end


    # @talents = Talent.all
    @users = Talent.all.where.not(user_id: current_user.id).map do |talent|
      ["#{talent.user.first_name} #{talent.user.last_name}", talent.user.id]
    end
    @users.uniq!
    @talents_id = Talent.all.map do |talent|
      talent.id
    end

    # create audio file
    @audio_file = AudioFile.new
    @comment = Comment.new
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
      redirect_to track_path(@track)
    else
      # Is this used anywhere ?
      if @track.update(track_params)
        @track.updated_at = Time.now
        @project = @track.project
        redirect_to project_path(@project)
      else
        render :show
      end
      # End of possibly useless code
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

  def brief_params
    params.require(:track).permit(:brief)
  end
end
