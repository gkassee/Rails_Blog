class ProfileController < ApplicationController
  def index
  end

  def show
  	@user = User.find(params[:id])
    @post = Post.new
  end
end
