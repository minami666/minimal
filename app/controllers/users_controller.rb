class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @room = @user.roomimages
    @roomimage = Roomimage.new
  end

end