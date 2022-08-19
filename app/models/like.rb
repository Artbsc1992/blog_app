class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_like_counter

  def update_like_counter
    post.update(likesCount: post.likesCount + 1)
  end
end
