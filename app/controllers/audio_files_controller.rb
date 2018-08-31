class AudioFilesController < ApplicationController
  def new
    @audio_file = AudioFile.new
    @audio_file.session = Session.find_by(params[:id])
  end

  def create
    @audio_file = AudioFile.new(audio_file_params)
    timestamp = Date.today.strftime("%e%m")
    @audio_file.session = Session.find_by(params[:id])
    @audio_file.uploaded_by = current_user
    @audio_file.name = "#{@audio_file.session.track.name} - #{@audio_file.session.talent.skill.name} - #{timestamp} "

    if @audio_file.save
      redirect_to track_path(params[:track_id])
      flash[:notice] = "File uploaded !"
    else
      redirect_to track_path(params[:track_id])
      flash[:alert] = "File upload failed !"
    end

  end

  private

  def audio_file_params
    params.require(:audio_file).permit(:audio)
  end
end
