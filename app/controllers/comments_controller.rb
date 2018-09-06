class CommentsController < ApplicationController

  # TO DO nest comments index-new-create-edit-update routes in the audio_file #show (i.e. the player) TBC depending on player's doc
  # TO DO comment rattacher le comment à sa track_instant ?

  # before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_audio_file, only: [:index]

  def index
    @comments = @audio_file.comments
  end

  # def show; end

  def create
    @comment = Comment.new(comment_params)
    @audiofile = AudioFile.find(params[:comment][:audio_file_id])
    @session = @audiofile.session
    @comment.audio_file_id = params[:comment][:audio_file_id]
    @comment.user_id = params[:comment][:user_id]
    @comment.track_instant = params[:comment][:track_instant]
    # @comment.track_instant = ??
    @audiofileid = params[:comment][:audio_file_id]
    if @comment.save
      respond_to do |format|
        format.html {redirect_to track_path(params[:comment][:id])}
        format.js

      end
    else
      redirect_to track_path(params[:comment][:id])
    end
  end

  # def edit; end

  # def update
  #   if @comment.update(comment_params)
  #     redirect_to # player or comments#index ?
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @comment.destroy
  # end

  private

  def set_audio_file
    @audio_file = AudioFile.find(params[:audio_file_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content) #only thing the user should input, not sure about track_instant
  end
end
