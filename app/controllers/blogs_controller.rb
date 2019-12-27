class BlogsController < ApplicationController

  def index
    @blogs = Blog.includes(:user)
  end

  def new
    @user = User.find(current_user.id)
    @blog = Blog.new
  end

  def create
    @blog = blog.create!(blogs_params)
    if @blog.save
      redirect_to user_path(current_user)
    else
      render action: 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blogs_params)
      redirect_to user_path(current_user)
    else
      render edit_blog_path
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to user_path(current_user)
  end

  private
    def blogs_params
      params.require(:blog).permit(:image,:text).merge(user_id: current_user.id)
    end

end
