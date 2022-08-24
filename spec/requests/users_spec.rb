require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET /users' do
    before do
      user = User.new(name: 'Tom', bio: 'I am a developer', photo: 'photo.png', postCount: 5)
      user.save
      get users_path
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the users/index template' do
      expect(response).to render_template(:index)
    end

    it "Body should include the text 'Users'" do
      expect(response.body).to include('Tom')
    end
  end

  describe 'GET /users/:id' do
    before do
      user = User.new(name: 'Tom', bio: 'I am a developer', photo: 'photo.png', postCount: 5)
      user.save
      get user_path(id: 1)
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the users/show template' do
      expect(response).to render_template(:show)
    end

    it "Body should include the text 'User'" do
      expect(response.body).to include('Tom')
    end
  end
end
