class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @room = @user.roomimages
    @roomimage = Roomimage.new
  end

end