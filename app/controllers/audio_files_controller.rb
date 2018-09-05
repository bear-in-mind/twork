class AudioFilesController < ApplicationController
  def new
    @audio_file = AudioFile.new
    @audio_file.session = Session.find_by(params[:id])
  end

  def create
    @audio_file = AudioFile.new(audio_file_params)
    @audio_file.session_id = params[:session_id]
    @audio_file.uploaded_by = current_user
    # timestamp = Date.today.strftime("%e%m")
    # @audio_file.name = "#{@audio_file.session.talent.skill.name} - #{timestamp} "

    if @audio_file.save
      redirect_to track_path(@audio_file.session.track)
      flash[:notice] = "File uploaded !"
    else
      raise
      redirect_to track_path(@audio_file.session.track)
      flash[:alert] = "File upload failed !"
    end

  end

  private

  def audio_file_params
    params.require(:audio_file).permit(:audio, :name)
  end
end
