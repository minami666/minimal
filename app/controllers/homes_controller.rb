class HomesController < ApplicationController

  def index
    @rooms = Roomimage.all
  end

end