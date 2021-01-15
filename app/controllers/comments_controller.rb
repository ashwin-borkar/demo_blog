class CommentsController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
    if @comment = @post.comments.create(params[:comment].permit(:name, :comment))
      flash[:success] = "Comment saved!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong!"
      render root_path  
    end    
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comment destroy!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong!"
      render root_path
    end
  end
end
