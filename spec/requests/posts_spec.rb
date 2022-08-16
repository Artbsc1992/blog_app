require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET users/:id/posts' do
    before do
      get user_posts_path(user_id: '10')
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the users/:id/posts template' do
      expect(response).to render_template(:index)
    end

    it "Body should include the text 'Posts list'" do
      expect(response.body).to include('Posts list')
    end
  end

  describe 'GET users/:id/posts/:id' do
    before do
      get user_post_path(user_id: '10', id: '10')
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the users/:id/posts/:id template' do
      expect(response).to render_template(:show)
    end

    it "Body should include the text 'Post 1'" do
      expect(response.body).to include('Post 1')
    end
  end
end
