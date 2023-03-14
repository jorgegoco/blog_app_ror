# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
Like.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all


user1 = User.create!(name: 'Pepe', photo: 'https://pepe', email: 'test1@gmail.com', bio: 'nobio', password: '123123')
user2 = User.create!(name: 'Pótamo', photo: 'https://pótamo', email: 'test2@gmail.com', bio: 'some', password: '456456')
post1 = user1.posts.create!(title: 'Pepe1 Post', text: 'Pepe1 text')
post2 = user1.posts.create!(title: 'Pepe2 Post', text: 'Pepe2 text')
post3 = user1.posts.create!(title: 'Pepe3 Post', text: 'Pepe3 text')
post4 = user2.posts.create!(title: 'Pótamo1 Post', text: 'Pótamo1 text')
post5 = user2.posts.create!(title: 'Pótamo2 Post', text: 'Pótamo2 text')
post6 = user2.posts.create!(title: 'Pótamo3 Post', text: 'Pótamo3 text')
comment1 = post1.comments.create!(text: 'Hi there!', author: user2)
comment2 = post1.comments.create!(text: 'Nice to hear from you again', author: user1)
