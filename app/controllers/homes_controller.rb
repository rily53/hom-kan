class HomesController < ApplicationController
  

  def index
    # @home = Home.find(params[:home_id])
    # group = Home.joins(:users)
    # @home = group.find(params[:user_id])
    # @tasks = @home.tasks.includes(:user)
    @homes = Home.all.order(updated_ad: :desc)
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

  def show
    @home = Home.find_by(id: params[:id])
    if !@home.users.include?(current_user)
      @home.users << current_user
    end
    @tasks = Task.where(home_id: @home.id).all
  end

  private

  def home_params
    params.require(:home).permit(:home_name, { user_ids: []} )
  end

  def task_params
    params.require(:task).permit(:task, :deadline, :responsible_person, :status_id).merge(user_id: current_user.id, home_id: params[:home_id])
  end

end
