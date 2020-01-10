class CommentsController < ApplicationController

  def create
    @comment = Comment.create!(comments_params)
    if @blog.save
      redirect_to user_path(current_user)
    else
      render action: 'new'
    end
  end

  private
    def comments_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id)
    end
end