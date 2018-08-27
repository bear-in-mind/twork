class TalentsController < ApplicationController
  def new
    # authorize @talent
    @talent = Talent.find(params[:id])
  end

  def create
    # authorize @talent
    @talent = Talent.New(talent_params)
    if @talent.save
      redirect_to user_path(@talent)
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
    current_user.update(user_params)
    redirect_to user_path(params[:id])
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
