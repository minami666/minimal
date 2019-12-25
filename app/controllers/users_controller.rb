class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @room = @user.roomimages
    @roomimage = Roomimage.new
  end

end