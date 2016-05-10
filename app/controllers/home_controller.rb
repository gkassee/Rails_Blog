class HomeController < ApplicationController

  def index
  	@user = current_user
  	@posts = Post.all
  	@post = Post.new
  end


end
