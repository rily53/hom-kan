class HomesController < ApplicationController
  

  def index
    @home = Home.find(params[:id])
  end

  def new
    @home = Home.new
    # @home.users << current_user
  end

  def create
    @home = Home.new(home_params)
    # @home.user_ids = current_user
    if @home.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def home_params
    params.require(:home).permit(:home_name, { user_ids: []} )
  end

end
