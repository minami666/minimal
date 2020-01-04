class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user)
  end

  def new
    @user = User.find(current_user.id)
    @item = Item.new
  end

  def create
    @item = Item.create!(items_params)
    if @item.save
      redirect_to user_path(current_user)
    else
      render action: 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Itemimage.find(params[:id])
    if @item.update(items_params)
      redirect_to user_path(current_user)
    else
      render edit_item_path
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to user_path(current_user)
  end

  private
    def items_params
      params.require(:item).permit(:image,:text).merge(user_id: current_user.id)
    end

end