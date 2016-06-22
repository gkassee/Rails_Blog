class CommentsController < ApplicationController
  

	def new
		@comment = Comment.new
	end


  def create
  	@comment = Comment.new(comment_params)
    if @comment.save
      @post = Comment.last.post_id
  		redirect_to post_path(@post)
  	else
  		redirect_to user_path(current_user)
  	end
  end


  def edit
    @comment = Comment.find(params[:id])
  end 

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    @comment.save
    redirect_to post_path(@comment.post_id)
  end


  def delete
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    redirect_to post_path(@comment.post_id)
    @comment.destroy
  end


  private

  def comment_params
  	params.require(:comment).permit(:user_id, :post_id, :body)
  end


end
