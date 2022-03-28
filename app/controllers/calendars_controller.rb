class CalendarsController < ApplicationController
  before_action :set_item

  def index
    # @home = Home.find_by(id: params[:home_id])
    @calendars = Calendar.where(@home_id).all
    @calendar = current_user.calendars.new
  end

  def show
    # @home = Home.find_by(id: params[:home_id])
    @calendar = Calendar.find(params[:id])
  end

  def new
    @calendar = current_user.calendar.new
    # @home = Home.find_by(id: params[:home_id])
  end

  def create
    # @home = Home.find_by(params[:home_id])
    @calendar = current_user.calendars.new(calendar_params)
    @calendar.home_id = params[:home_id]
    if @calendar.save
      redirect_to home_calendars_path(@home)
    else
      render :index
    end
  end

  def edit
    # @home = Home.find_by(id: params[:home_id])
    @calendar = Calendar.find(params[:id])
  end

  def update
    # @home = Home.find_by(id: params[:home_id])
    @calendar = Calendar.find(params[:id])
  end

  def destroy
    # @home = Home.find_by(id: params[:home_id])
    @calendar = Calendar.find(params[:id])
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title, :schedule, :start_date, :start_time, :end_date, :end_time).merge(user_id: current_user.id, home_id: params[:home_id])
  end

  def set_item
    @home = Home.find_by(id: params[:home_id])
  end

end
