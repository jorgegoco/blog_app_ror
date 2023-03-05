class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_validation :set_comments_counter_to_zero, :set_likes_counter_to_zero

  after_validation :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def set_comments_counter_to_zero
    self.comments_counter = 0 if comments_counter.nil?
  end

  def set_likes_counter_to_zero
    self.likes_counter = 0 if likes_counter.nil?
  end
end
