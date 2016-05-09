class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.where(name: params[:name]).first
  	if @user && @user.password == params[:password]
  		session[:user_id] = @user.id
  		redirect_to home_index_path
    else
      redirect_to log_in_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/'
  end
end
