require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  context 'get index user template in /users/18/posts path' do
    before(:each) do
      get '/users/18/posts'
    end

    it 'assert the HTTP status of the response as ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'assert template posts index being rendered' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('<h1>Here is a list of posts for a particular user</h1>')
    end
  end

  context 'get show posts template in /users/18/posts path' do
    before(:each) do
      get '/users/18/posts/1'
    end

    it 'assert the HTTP status of the response as ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'assert template posts show being rendered' do
      expect(response).to render_template('show')
    end

    it 'assert the content of the response body matches the placeholder text' do
      expect(response.body).to include('<h1>Here is the details about this post from this user</h1>')
    end
  end
end