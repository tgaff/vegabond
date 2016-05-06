class PostsController < ApplicationController



  def show
    @post = Post.find_by_id(params[:id])
    render :show
  end
end
