class RoomlikesController < ApplicationController

  def create
    @roomlike = current_user.roomlikes.create(roomimage_id: params[:roomimage_id])
    redirect_back(fallback_location: roomimage_path(id: params[:roomimage_id]))
  end

  def destroy
    @roomlike = Roomlike.find_by(roomimage_id: params[:roomimage_id], user_id: current_user.id)
    @roomlike.destroy
    redirect_back(fallback_location: roomimage_path(id: params[:roomimage_id]))
  end

end