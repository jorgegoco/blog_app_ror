# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Like.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all


user1 = User.create!(name: 'TipyColl  ', photo: 'https://agendacultural.castillalamancha.es/sites/agendacultural.castillalamancha.es/files/actividades/imagenes/tip_y_coll.png', email: 'tipycoll@gmail.com', bio: 'long', password: 'long123')
user2 = User.create!(name: 'PepePotamo', photo: 'https://i.ytimg.com/vi/sN3R8bE_BDg/maxresdefault.jpg', email: 'pepepotamo@gmail.com', bio: 'nobio', password: '123123')
user3 = User.create!(name: 'PapaPig', photo: 'https://pbs.twimg.com/media/EgRn5JSWAAMXOp9.jpg', email: 'papapig@gmail.com', bio: 'some', password: '456456')
post1 = user1.posts.create!(title: 'First tipycoll post', text: 'First tipycoll post text')
post2 = user1.posts.create!(title: 'Second tipycoll post', text: 'Second tipycoll post text')
post3 = user1.posts.create!(title: 'Third tipycollpost', text: 'Third tipycoll post text')
post4 = user2.posts.create!(title: 'First pepepotamo post', text: 'First pepepotamo post text')
post5 = user2.posts.create!(title: 'Second pepepotamo post', text: 'Second pepepotamo post text')
post6 = user2.posts.create!(title: 'Third pepepotamo post', text: 'Third pepepotamo post text')
comment1 = post1.comments.create!(text: 'Hi there!', author: user2)
comment2 = post1.comments.create!(text: 'Nice to hear from you again', author: user1)
