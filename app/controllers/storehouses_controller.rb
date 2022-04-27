class StorehousesController < ApplicationController
  before_action :set_home_find
  before_action :set_storehouse_find, only: [:show, :edit, :update, :destroy]

  def index
    @storehouses = Storehouse.where(@home_id).all
    # if @storehouses.folder_name==
    # end
    @storehouse = current_user.storehouses.new
  end

  def show
    @storehouses = Storehouse.where(folder_name: params[:folder_name])
  end

  def new
  end

  def create
    @storehouse = @home.storehouses.new(storehouse_params)
    if @storehouse.save
      redirect_to home_storehouses_path(@home)
    else
      # @storehouses = Storehouses.where(@home_id).all
      render :index
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @storehouse.user_id
  end

  def update
    if @storehouse.update(storehouse_params)
      redirect_to home_storehouses_path(@home)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path unless current_user.id == @storehouse.user_id
    @storehouse.destroy
    redirect_to home_storehouses_path(@home)
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

  def set_storehouse_find
    @storehouse = Storehouse.find(params[:id])
  end

end
