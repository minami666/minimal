class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    # binding.pry
    if @comment.save!
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id,roomimage_id: params[:roomimage_id])
    end
end