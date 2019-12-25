class RoomimagesController < ApplicationController

  def new
    @user = User.find(current_user.id)
    @roomimage = Roomimage.new
  end

  def create
    # binding.pry
    @roomimage = Roomimage.create!(roomimages_params)
    if @roomimage.save
      redirect_to user_path(current_user)
    else
      render action: 'new'
    end
  end

  private
    def roomimages_params
      params.require(:roomimage).permit(:image,:text).merge(user_id: current_user.id)
    end


end
