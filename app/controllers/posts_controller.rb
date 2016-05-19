class PostsController < ApplicationController

  before_action :logged_in?, only: [:new, :delete, :edit]

  # dead code
  # def index
  # end

  # the raked route is:
  # new_city_post GET    /cities/:city_id/posts/new(.:format)      posts#new
  def new
    # there is no params[:id] on this route!
    # @user = User.find_by_id(params[:id])
    @post = Post.new
    # unnecessary variable
    #city_id = params[:city_id]
    @city = City.find_by(id: params[:city_id])
    @full_background = true
  end

=begin
  def create
    city = City.find(params[:city_id])
    # why not name the variable accurately?
    # ex.  user_id = current_user.id
    user = current_user[:id]
    new_post = Post.new(post_params)
    # why don't you just assign user instead of user_id ??
    # You don't have to do all this manual stuff in rails
    # ex: new_post.user = current_user
    new_post.user_id = user
    # shouldn't you do this first?
    if current_user
      if new_post.save
        city.posts << new_post
        redirect_to city_path(city)
      else
        # flash message please
        render :new
      end
    else
      flash[:notice] = "You must be logged in to post"
      redirect_to "/"
    end
  end
=end
  def create
    if current_user
      city = City.find(params[:city_id])
      new_post = Post.new(post_params)
      new_post.user = current_user
      if new_post.save
        city.posts << new_post
        redirect_to city_path(city)
      else
        # maybe add a flash message?
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
    # unused variable - this is a post show page not an index
    # @posts = @city.posts
    # don't hardcode this, database IDs are up to the database only
    # if @city[:id] == 1
    #   @cityclass = "sanfrancisco"
    # elsif @city[:id] == 2
    #   @cityclass = "valdivia"
    # elsif @city[:id] == 3
    #   @cityclass = "melbourne"
    # else
    #   @cityclass = "istanbul"
    # end
    @cityclass = @city.name
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

    #if current_user.id == @post[:user_id]  # good but how about the below
    if current_user == @post.user
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
      # cool
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
