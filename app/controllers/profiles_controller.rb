class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]

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
