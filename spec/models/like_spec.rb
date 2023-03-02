require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.create(name: 'pepe', photo: 'pepe@hotmail.com', bio: 'Un malandro', posts_counter: 0)
    user1 = User.create(name: 'potamo', photo: 'potamo@cool.com', bio: 'Otro malandro',
                        posts_counter: 0)
    post1 = Post.create(title: 'post1', text: 'text1', comments_counter: 0, likes_counter: 0, author: user)
    Like.create(post: post1, author: user1)
    Like.create(post: post1, author: user1)
  end

  it 'likes should be valid' do
    expect(subject).to be_valid
  end

  it 'should update likes_counter' do
    expect(subject.post.likes_counter).to eq 2
  end
end
