class CommentsController < ApplicationController

  def create
    @comment = Comment.create!(comments_params)
    if @comment.save
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  private
    def comments_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id,roomimage_id: params[:roomimage_id])
    end
end