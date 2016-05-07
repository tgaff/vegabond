class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    user = User.find_by_id(current_user)
    new_post = Post.new(post_params)
    new_post.user_id = current_user.id
    if new_post.save
      user.posts << new_post
      redirect_to user_path(user)
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    render :show
  end

  private
  def post_params
    params.require(:post).permit(:title, :city, :story, :author)
  end
end
