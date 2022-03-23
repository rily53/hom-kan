class TasksController < ApplicationController

  def index
    # @tasks = Task.find(params[:home_id])
    # @tasks = @home.tasks.includes(:user)
  end

  def new
    @task = current_user.tasks.new
    @home = Home.find_by(id: params[:home_id])
    # @task = Task.new
    # @home = Home.find(params[:home_id])
    # @home = Home.find(params[:home_id])
    # @task = @home.task.new(task_params)
  end

  def create
    @home = Home.find_by(params[:home_id])
    @task = current_user.tasks.new(task_params)
    @task.home_id = params[:home_id]
    # @task = Task.new(task_params)
    if @task.save
      redirect_to home_path(@home)
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:task, :deadline, :responsible_person, :status_id).merge(user_id: current_user.id, home_id: params[:home_id])
  end

end
