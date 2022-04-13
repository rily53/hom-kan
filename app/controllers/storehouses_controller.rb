class StorehousesController < ApplicationController
  before_action :set_home_find

  def index
    @storehouses = Storehouse.where(@home_id).all
    @storehouse = current_user.storehouses.new
  end

  def new
  end

  def create
    @storehouse = @home.storehouses.new(storehouse_params)
    if @storehouse.save
      redirect_to home_storehouses_path(@home), notice:"completion"
    else
      # @storehouses = Storehouses.where(@home_id).all
      render :index
    end
  end

  def show
  end

  private

  def storehouse_params
    params.require(:storehouse).permit(:folder_name, :file_name, :file_memo, images: []).merge(user_id: current_user.id, home_id: params[:home_id])
  end

  def set_home_find
    # @home = Home.find_by(id: params[:home_id])
    # 調べたコード
    @home = Home.find(params[:home_id])
    # Homeテーブルからhome_idカラムを取得 "id"のみだとエラー
  end

end
