require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { User.create(name: 'pepe', photo: 'pepe@hotmail.com', bio: 'Un malandro', posts_counter: 0) }
 
  it 'user should be valid' do
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = '5.3'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'three most recent posts from an user method ' do
    Post.create(author: subject, title: 'post1', text: 'text1', comments_counter: 0, likes_counter: 0)
    Post.create(author: subject, title: 'post2', text: 'text2', comments_counter: 0, likes_counter: 0)
    Post.create(author: subject, title: 'post3', text: 'text3', comments_counter: 0, likes_counter: 0)
    Post.create(author: subject, title: 'post4', text: 'text4', comments_counter: 0, likes_counter: 0)
    expect(subject.three_recent_posts).to eq(subject.posts.order(updated_at: :desc).limit(3))
    expect(subject.three_recent_posts.length).to eq 3
  end
end