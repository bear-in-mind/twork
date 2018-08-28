class CommentsController < ApplicationController

  # TO DO nest comments index-new-create-edit-update routes in the audio_file #show (i.e. the player) TBC depending on player's doc
  # TO DO comment rattacher le comment à sa track_instant ?

  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_audio_file, only: [:index, :create, :update]

  def index
    @comments = @audio_file.comments
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.audio_file = @audio_file
    @comment.user_id = current_user.id
    # @comment.track_instant = ??
    if @comment.save
      redirect_to # player or comments#index ?
    else
      render :new
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to # player or comments#index ?
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
  end

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
