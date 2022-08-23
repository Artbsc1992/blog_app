require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET users/:id/posts' do
    before do
      user = User.new(name: 'Tom', bio: 'I am a developer', photo: 'photo.png', postCount: 5)
      user.save
      get user_posts_path(user_id: '1')
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the users/:id/posts template' do
      expect(response).to render_template(:index)
    end

    it "Body should include the text 'User name'" do
      expect(response.body).to include('Tom')
    end
  end

  describe 'GET users/:id/posts/:id' do
    before do
      user = User.new(name: 'Tom', bio: 'I am a developer', photo: 'photo.png', postCount: 5)
      user.save
      post = Post.new(user: user, title: 'Post title', text: 'Post text')
      post.save
      get user_post_path(user_id: user.id, id: post.id)
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the users/:id/posts/:id template' do
      expect(response).to render_template(:show)
    end

    it "Body should include the text 'Post text''" do
      expect(response.body).to include('Post text')
    end
  end
end
