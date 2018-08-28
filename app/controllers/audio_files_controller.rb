class AudioFilesController < ApplicationController
  def new
    @audio_file = AudioFile.new
    @audio_file.session = Session.find_by(params[:id])
  end

  def create
    @audio_file = AudioFile.new(audio_file_params)
    timestamp = Date.now.strftime("%y-%l-%e-%m-%M")
    @audio_file.session = Session.find_by(params[:id])
    @audio_file.user = current_user
    @audio_file.name = "#{@audio_file.session.track.name} - #{@audio_file.session.talent} - #{timestamp} "

    @audio_file.save
    redirect_to_track_path(@audio_file.track)
  end

  private

  def audio_file_params
    params.require(:audio_file).permit(:audio)
  end
end
