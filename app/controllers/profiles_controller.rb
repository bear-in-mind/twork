class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]

  def show
    # authorize current_user
    @profile = User.find(params[:id])
    @talent = Talent.new

    # on enleve toutes les skills que le user a deja
    profile_skills = @profile.skills.map(&:id)
    @remaining_skills = Skill.all.reject{|skill| profile_skills.include?(skill.id)}

    # @review = Review.new
    # @review.user_id = params[:id]
    # @markers = [{ lat: @user.latitude, lng: @user.longitude }]
  end

  def edit

  end

  def update
    # raise
    if params[:user][:skills].present?
      @skills = Skill.where(id: params[:user][:skills])
      @skills.each do |skill_iter|
        Talent.create(user: @profile, skill: skill_iter)
      end
    else
      current_user.update(profile_params)
    end
    redirect_to profile_path(@profile)
  end

  def destroy
    # what do we do ? Do we want to delete profiles?
  end

  private

  def set_profile
    @profile = User.find(params[:id])
    # authorize @profile
  end

  def profile_params
    params.require(:user).permit(:main_occupation, :bio, genres:[])
  end
end
