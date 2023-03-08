class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_validation :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end
  def comment_author
    author.name
  end
end
