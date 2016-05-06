class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new    
  end


  def show
    @post = Post.find_by_id(params[:id])
    render :show
  end
end
