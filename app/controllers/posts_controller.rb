class PostsController < ApplicationController

  before_action :logged_in?, only: [:new]

  def index
  end

  def new
    @post = Post.new
    city_id = params[:city_id]
    @city = City.find_by(id: city_id)
    @full_background = true
  end

  def create
    city = City.find(params[:city_id])
    user = current_user[:id]
    new_post = Post.new(post_params)
    new_post.user_id = user

    if new_post.save
      city.posts << new_post
      redirect_to city_path(city)
    else
      redirect_to new_city_post_path(user)
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    @city = City.find_by_id(params[:city_id])
  end

  def edit
    @post = Post.find_by_id(params[:id])
    @city = City.find_by_id(params[:city_id])
  end

  def update
    city = City.find(params[:city_id])
    user_id = current_user[:id]
    post = Post.find_by_id(params[:id])
    post[:user_id] = user_id
    if post.update(post_params)
      redirect_to city_path(city)
    else
      redirect_to edit_post_path
    end
  end

  def destroy
    post = Post.find_by_id(params[:id])
    post.destroy
    city = City.find_by_id(params[:city_id])
    redirect_to city_path(city)

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
