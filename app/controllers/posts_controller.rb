class PostsController < ApplicationController

  before_action :logged_in?, only: [:new, :delete, :edit]


  def index
  end

  def new
    @user = User.find_by_id(params[:id])
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
    if current_user
      if new_post.save
        city.posts << new_post
        redirect_to city_path(city)
      else
        render :new
      end
    else
      flash[:notice] = "You must be logged in to post"
      redirect_to "/"
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    @city = City.find_by_id(params[:city_id])
    @posts = @city.posts
    if @city[:id] == 1
      @cityclass = "sanfrancisco"
    elsif @city[:id] == 2
      @cityclass = "valdivia"
    elsif @city[:id] == 3
      @cityclass = "melbourne"
    else
      @cityclass = "istanbul"
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
    @city = City.find_by_id(params[:city_id])
    @cityclass = "page"
    @full_background = "true"
  end

  def update
    @city = City.find(params[:city_id])
    @post = Post.find_by_id(params[:id])
    # @post[:user_id] = current_user[:id]
    if current_user.id == @post[:user_id]
      if @post.update(post_params)
        redirect_to city_path(@city)
      else
        redirect_to edit_post_path
      end

    else

      flash[:notice] = "You can not edit other user's posts"
      redirect_to city_path(@city)

    end
  end

  def destroy
    post = Post.find_by_id(params[:id])
    if current_user.id == post[:user_id]
      post.destroy
      city = City.find_by_id(params[:city_id])
      if request.referrer.include?('/user')
        redirect_to current_user
      else
        redirect_to city_path(city)
      end
    else
      flash.now[:notice] = "You can not delete other user posts"
      redirect_to city_path(city)
    end
  end

  def logged_in?
    if session[:user_id] == nil
      flash[:notice] = "Must be logged in to see this page"
      redirect_to root_path
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :story)
  end
end
