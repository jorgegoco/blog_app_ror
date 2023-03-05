class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_validation :update_likes_counter

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
