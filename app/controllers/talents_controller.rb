class TalentsController < ApplicationController
  def destroy
    # authorize @talent
    @talent.destroy
    redirect_to(user_path(params[:id]))
  end
end
