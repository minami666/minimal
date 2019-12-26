class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @room = @user.roomimages
    @roomimage = Roomimage.new
  end

  def destroy
    @roomimage = Roomimage.find_by(user_id: current_user.id)
  end

end