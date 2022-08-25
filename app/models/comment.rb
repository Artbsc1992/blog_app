class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_comment_counter
  after_destroy :decrement_comment_counter

  def update_comment_counter
    post.commentsCount = post.commentsCount + 1
    post.save
  end

  def decrement_comment_counter
    if Comment.all.length == 0
      post.commentsCount = 0
      post.save
    else
      post.postCount = post.commentsCount - 1
      post.save
    end
  end
end
