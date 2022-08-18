class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like.user = current_user
    @like.post = Post.find(params[:post_id])
    @like = Like.new(like_params)
    @like.save
    redirect_to user_posts_path(@like.user, @like.post)

  end

  private
  def like_params
    params.require(:like).permit(@like.user, @like.post)
  end

end
