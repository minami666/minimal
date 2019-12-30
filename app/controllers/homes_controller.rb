class HomesController < ApplicationController

  def index
    @rooms = Roomimage.all
    @users = User.all.order(created_at: :desc)
  end

end