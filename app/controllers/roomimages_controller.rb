class RoomimagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @rooms = Roomimage.all.order(created_at: :DESC)
  end

  def showindex
    @user = User.find(params[:id])
    @rooms = @user.roomimages.all
    @room = Roomimage.new
  end

  def show
    @room = Roomimage.find(params[:id])
    @roomlike = Roomlike.new
    @user = @room.user
    @comment = Comment.new
    @comments = @room.comments
  end

  def new
    @user = User.find(current_user.id)
    @roomimage = Roomimage.new
  end

  def create
    @roomimage = Roomimage.create!(roomimages_params)
    if @roomimage.save
      redirect_to user_path(current_user)
    else
      render action: 'new'
    end
  end

  def edit
    @room = Roomimage.find(params[:id])
  end

  def update
    @room = Roomimage.find(params[:id])
    if @room.update(roomimages_params)
      redirect_to user_path(current_user)
    else
      render edit_roomimage_path
    end
  end

  def destroy
    room = Roomimage.find(params[:id])
    room.destroy
    redirect_to user_path(current_user)
  end

  private
    def roomimages_params
      params.require(:roomimage).permit(:image,:text).merge(user_id: current_user.id)
    end

end
