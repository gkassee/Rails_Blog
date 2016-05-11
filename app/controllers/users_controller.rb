class UsersController < ApplicationController

  def index
    @users = User.all
    render :layout => "login_layout.html.erb"

  end


  def show
    @user = User.find(params[:id])
    @post = Post.new
  end


  def new
    @user = User.new
    render :layout => "login_layout.html.erb"
  end


  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    redirect_to user_path(@user.id)
  end


  def destroy
  end


private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

end
