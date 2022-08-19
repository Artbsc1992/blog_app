class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @author = User.find(params[:user_id])
    Like.create(user: @user, post: @post)
    redirect_to request.referrer
  end
end
