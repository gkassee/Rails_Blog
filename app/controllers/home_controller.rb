class HomeController < ApplicationController

  def index
  	@user = @current_user
  	@posts = Post.all
  	 @post = Post.new
  end

 private

 	def current_user     
  	if session[:user_id]       
    @current_user = User.find(session[:user_id])     
  	end   
	end

end
