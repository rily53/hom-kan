class HomesController < ApplicationController

  def index
    @homes = Home.find(params[:home_id])
    # group = Home.joins(:users)
    # @home = group.find(params[:user_id])
    # @tasks = @home.tasks.includes(:user)
    @homes = Home.all.order(updated_ad: :desc)
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    if @home.save
      redirect_to room_homes_path
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

  def room
    # @home = Home.find_by(id: params[:id])
    # @home = Home.find(params[:home_id])
  end

  private

  def home_params
    params.require(:home).permit(:home_name, { user_ids: []} )
    # params.require(:home).permit(:home_name, user_ids: [] )
  end

  def task_params
    params.require(:task).permit(:task, :deadline, :responsible_person, :status_id).merge(user_id: current_user.id, home_id: params[:home_id])
  end

  def set_home_find
    # @home = Home.find_by(id: params[:home_id])
    # 調べたコード
    @home = Home.find(params[:home_id])
    # Homeテーブルからhome_idカラムを取得 "id"のみだとエラー
  end

end
