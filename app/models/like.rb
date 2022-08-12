class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_like_counter(post)
    post.update(likesCount: Like.where(post:).count)
  end
end
