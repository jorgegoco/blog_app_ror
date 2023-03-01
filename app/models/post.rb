class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
