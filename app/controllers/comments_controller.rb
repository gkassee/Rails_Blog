class CommentsController < ApplicationController
  

	def new
		@comment = Comment.new
	end


  def create
  	@post = Comment.last.post_id
  	@comment = Comment.new(comment_params)
    if @comment.save
  		redirect_to post_path(@post)
  	else
  		redirect_to user_path(current_user)
  	end


  end


  def destroy
  end


  private

  def comment_params
  	params.require(:comment).permit(:user_id, :post_id, :body)
  end


end
