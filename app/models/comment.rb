class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comment_counter
    post.commentsCount = post.commentsCount + 1
    post.save
  end
end
