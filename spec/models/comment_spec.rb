require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.create(name: 'pepe', photo: 'pepe@hotmail.com', bio: 'Un malandro', posts_counter: 0)
    user1 = User.create(name: 'potamo', photo: 'potamo@cool.com', bio: 'Otro malandro', posts_counter: 0)                  
    post = Post.create(title: 'post1', text: 'text1', comments_counter: 0, likes_counter: 0, author: user)
    Comment.create(post: post, author: user1, text: 'text1')
    Comment.create(post: post, author: user1, text: 'text2')
  end

  it 'comments should be valid' do
    expect(subject).to be_valid
  end

  it 'should update comments_counter' do
    expect(subject.post.comments_counter).to eq 2
  end
end
