class HomesController < ApplicationController

  def index
    
  end

  def new
    @home = Home.new
  end

end
