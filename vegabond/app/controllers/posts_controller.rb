class PostsController < ApplicationController

  before_action :logged_in?, only: [:show]

  def new
    @post = Post.new
    render :new
  end

  def create
    user = User.find_by_id(current_user)
    city = City.find_by_id(params[:id])
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

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update_attributes(post_params)

    redirect_to @post
  end

  def logged_in?
    if session[:user_id] == nil
      flash[:notice] = "Must be logged in to see this page"
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :city, :story, :author)
  end
end
