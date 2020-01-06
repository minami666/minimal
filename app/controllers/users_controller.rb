class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @room = @user.roomimages
    @roomimage = Roomimage.new
    @follows = Relationship.where(user_id: params[:id]).count
    @followers = Relationship.where(follow_id: params[:id]).count
  end

end