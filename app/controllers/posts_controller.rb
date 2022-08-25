class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id)
    @comments.destroy_all
    @likes = Like.where(post_id: @post.id)
    @likes.destroy_all
    @post.destroy
    current_user.postCount -= 1
    flash[:success] = 'Post deleted'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
