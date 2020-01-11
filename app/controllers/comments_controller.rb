class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.save!
      redirect_to roomimage_path(params[:roomimage_id])
    else
      redirect_to roomimage_path(params[:roomimage_id])
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id,roomimage_id: params[:roomimage_id])
    end
end