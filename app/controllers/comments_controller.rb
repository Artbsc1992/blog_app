class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to user_posts_path(@comment.user, @comment.post)
    else
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text) 
  end
end
