require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  context 'get index user template in root path' do
    before(:each) do
      get '/'
    end

    it 'assert the HTTP status of the response as ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'assert template user index being rendered' do
      expect(response).to render_template(:index)
    end

    it 'assert the content of the response body matches the placeholder text' do
      expect(response.body).to include('<h1>Here is a list of users</h1>')
    end
  end

  context 'get index user template in users path' do
    before(:each) do
      get '/users'
    end

    it 'assert the HTTP status of the response as ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'assert template user index being rendered' do
      expect(response).to render_template(:index)
    end

    it 'assert the content of the response body matches the placeholder text' do
      expect(response.body).to include('<h1>Here is a list of users</h1>')
    end
  end

  context 'get show user template in users/:id path' do
    before(:each) do
      get '/users/18'
    end

    it 'assert the HTTP status of the response as ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'assert template user show being rendered' do
      expect(response).to render_template(:show)
    end

    it 'assert the content of the response body matches the placeholder text' do
      expect(response.body).to include('<h1>Here is a list of posts for a particular user</h1>')
    end
  end
end
