class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]

  def show
    # authorize current_user
    @profile = User.find(params[:id])
    # @review = Review.new
    # @review.user_id = params[:id]
    # @markers = [{ lat: @user.latitude, lng: @user.longitude }]
  end

  def edit; end

  def update
    @profile.update(profile_params)
  end

  def destroy
    # what do we do ?
  end

  private

  def set_profile
    @profile = User.find(params[:id])
    authorize @profile
  end

  def profile_params
    params.require(:profile).permit(:avatar, :banner, :bio, :genres, :main_occupation)
  end
end
