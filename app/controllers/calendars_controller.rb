class CalendarsController < ApplicationController
  before_action :set_item

  def index
    @calendars = @home.calendars.order(start_date: :ASC).limit(10)
    # home_idとcalendarテーブル一致データを昇順で取得 今後：並び順(本日〜)
    @calendar = current_user.calendars.new
  end

  def show
    @calendar = Calendar.find(params[:id])
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
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])
  end

  def destroy
    @calendar = Calendar.find(params[:id])
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title, :schedule, :member, :start_date, :start_time, :end_date, :end_time).merge(user_id: current_user.id, home_id: params[:home_id])
  end

  def set_item
    # @home = Home.find_by(id: params[:home_id])
    # 調べたコード
    @home = Home.find(params[:home_id])
    # Homeテーブルからhome_idカラムを取得 "id"のみだとエラー
  end

end
