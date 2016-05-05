class SessionsController < ApplicationController

  #created by phill and adam
  def new
    @user = User.new
    render :new
  end
end
