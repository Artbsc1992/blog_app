class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCount, numericality: { only_integer: true }
  validates :commentsCount, comparison: { greater_than_or_equal_to: 0 }
  validates :likesCount, numericality: { only_integer: true }
  validates :likesCount, comparison: { greater_than_or_equal_to: 0 }

  def update_post_counter
    user.postCount = user.postCount + 1
    user.save
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
