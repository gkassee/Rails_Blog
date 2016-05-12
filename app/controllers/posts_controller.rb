class PostsController < ApplicationController

  def new
    @post = Post.new
  end
  
  def create
  	@post = Post.new(post_params)
    if @post.save
  		redirect_to user_path(current_user)
  	else
  		redirect_to posts_path
  	end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    @post.save
    redirect_to post_path(params[:id])
  end

  def destroy
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Post.find(params[:id]).comments
  end

private

	def post_params
		params.require(:post).permit(:user_id, :title, :body)
	end

end
