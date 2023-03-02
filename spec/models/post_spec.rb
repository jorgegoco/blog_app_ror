require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.create(author: User.create(name: 'pepe', photo: 'pepe@hotmail.com', bio: 'Un malandro', posts_counter: 0), title: 'post1', text: 'text1', comments_counter: 0, likes_counter: 0) }
  
  
  it 'Post should be valid' do
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = '5.3'
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    subject.likes_counter = '5.3'
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should update posts counter' do
    expect(subject.author.posts_counter).to eq 1
  end

  it 'returns the 5 most recent comments' do
    Comment.create(post: subject, author: subject.author, text: 'text1')
    Comment.create(post: subject, author: subject.author, text: 'text2')
    Comment.create(post: subject, author: subject.author, text: 'text3')
    Comment.create(post: subject, author: subject.author, text: 'text4')
    Comment.create(post: subject, author: subject.author, text: 'text5')
    Comment.create(post: subject, author: subject.author, text: 'text6')
    expect(subject.five_recent_comments.length).to eq 5
    expect(subject.five_recent_comments[0].text).to eq 'text6'
  end
end