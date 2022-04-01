class CalendarsController < ApplicationController
  before_action :set_home_find
  before_action :set_calendar_find, only: [:show, :edit, :update, :destroy]

  def index
    @calendars = @home.calendars.order(start_date: :ASC).limit(10)
    # home_idとcalendarテーブル一致データを昇順で取得 今後：並び順(本日〜)
    @calendar = current_user.calendars.new
  end

  def show
  end

  def new
    # @calendar = current_user.calendars.new
    # @calendar = calendars.new
  end

  def create
    @calendar = @home.calendars.new(calendar_params)
    # @calendar = current_user.calendar.new(calendar_params)
    # @calendar.home_id = params[:home_id]
    if @calendar.save
      redirect_to home_calendars_path(@home), notice:"completion"
    else
      @calendars = @home.calendars.order(start_date: :ASC).limit(10)
      render :index
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @calendar.user_id
  end

  def update
    if @calendar.update(calendar_params)
      redirect_to home_calendars_path(@home)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path unless current_user.id == @calendar.user_id
    @calendar.destroy
    redirect_to home_calendars_path(@home)
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title, :schedule, :member, :start_date, :s_time, :end_date, :e_time).merge(user_id: current_user.id, home_id: params[:home_id])
  end

  def set_home_find
    # @home = Home.find_by(id: params[:home_id])
    # 調べたコード
    @home = Home.find(params[:home_id])
    # Homeテーブルからhome_idカラムを取得 "id"のみだとエラー
  end

  def set_calendar_find
    @calendar = Calendar.find(params[:id])
  end

end
