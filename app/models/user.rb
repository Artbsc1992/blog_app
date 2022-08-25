class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :postCount, numericality: { only_integer: true }
  validates :postCount, comparison: { greater_than_or_equal_to: 0 }
  def most_recent_posts
    posts.includes([:user]).limit(3).order(created_at: :desc)
  end

  ROLES = %i[user admin].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end
end
