class RoomlikesController < ApplicationController

  def create
    @roomlike = current_user.roomlikes.create(post_id: params[:post_id])
    redirect_to root_path
  end

  def destroy
    @roomlike = Roomlike.find_by(roomimages_id: params[:roomimages_id], user_id: current_user.id)
    @roomlike.destroy
    redirect_to root_path
  end

end