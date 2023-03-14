require 'rails_helper'

describe 'posts#index', type: :feature do
  describe 'posts index page' do
    before(:each) do
      @user1 = User.create!(name: 'Pepe', photo: 'https://pepe', bio: 'nobio', posts_counter: 0)
      @user2 = User.create!(name: 'Pótamo', photo: 'https://pótamo', bio: 'some', posts_counter: 0)
      @post1 = @user1.posts.create!(title: 'Pepe1 Post', text: 'Pepe1 text', comments_counter: 0, likes_counter: 0)
      @post2 = @user1.posts.create!(title: 'Pepe2 Post', text: 'Pepe2 text', comments_counter: 0, likes_counter: 0)
      @post3 = @user1.posts.create!(title: 'Pepe3 Post', text: 'Pepe3 text', comments_counter: 0, likes_counter: 0)
      @post4 = @user1.posts.create!(title: 'Pepe4 Post', text: 'Pepe4 text', comments_counter: 0, likes_counter: 0)
      @comment1 = @post1.comments.create!(text: 'Hi there!', author_id: @user2.id)
      @comment2 = @post1.comments.create!(text: 'Nice to hear from you again', author_id: @user1.id)
      visit(user_posts_path(@user1))
    end

    scenario "I can see the user's profile picture" do
      expect(page).to have_xpath("//img[contains(@src,'https://pepe')]")
    end

    scenario "I can see the user's username" do
      expect(page).to have_content('Pepe')
    end

    scenario 'I can see the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 4')
    end

    scenario "I can see a post's title" do
      expect(page).to have_content('Pepe1 Post')
    end

    scenario "I can see some of the post's body" do
      expect(page).to have_content('Pepe1 text')
    end

    scenario 'I can see the first comments on a post' do
      expect(page).to have_content('Nice to hear from you again')
    end

    scenario 'I can see how many comments a post has' do
      expect(page).to have_content("Comments:#{@post1.comments_counter}")
    end

    scenario 'I can see how many likes a post has' do
      expect(page).to have_content("Likes:#{@post1.likes_counter}")
    end

    scenario "When I click on a post, it redirects me to that post's show page" do
      visit(user_post_path(@user1, @post1))
      expect(page).to have_current_path user_post_path(@user1, @post1)
    end
  end
end
