class TalentsController < ApplicationController
  def new
    authorize @talent
    @profile = current_user
    @talent = Talent.new
  end

  def create
    authorize @talent
    @talent = Talent.New(talent_params)
    @talent.user = current_user
    if @talent.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def edit
    # authorize @current_user if @talent == current_user
    @talent = Talent.find(params[:id])
  end

  def update
    # authorize current_user
    if current_user.update(user_params)
      redirect_to profile_path(current_user)
    else
      render :edit
    end

  end

  def destroy
    # authorize @talent
    @talent.destroy
    redirect_to(user_path(params[:id]))
  end

  private

  def talent_params
    params.require(:talent).permit(:skill_id)
  end

end
