class HomesController < ApplicationController

  def index
    @rooms = Roomimage.all
    @users = User.all.order(created_at: :desc)
    @user = User.find(current_user.id)
  end

end