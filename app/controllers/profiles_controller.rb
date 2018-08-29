class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]

  def show
    # authorize current_user
    @profile = User.find(params[:id])
    @talent = Talent.new
    # @review = Review.new
    # @review.user_id = params[:id]
    # @markers = [{ lat: @user.latitude, lng: @user.longitude }]
  end

  def edit
  end

  def update
    if params[:user][:skills].present?
      @skills = Skill.where(id: params[:user][:skills])
      @skills.each do |skill_iter|
        Talent.create(user: @profile, skill: skill_iter)
      end


    else
      @profile.update(profile_params)
    end
    redirect_to profile_path(@profile)
  end

  def destroy
    # what do we do ?
  end

  private

  def set_profile
    @profile = User.find(params[:id])
    # authorize @profile
  end

  # def profile_params
  #   params.require(:profile).permit(:avatar, :banner, :bio, :genres, :main_occupation)
  # end
end
