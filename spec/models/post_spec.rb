require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(name: 'Arturo', photo: 'www.google.com', bio: 'magician') }
  let(:post) { Post.create!(user:, title: 'hello', text: 'hello2') }

  describe 'title should be present' do
    it 'thus its not valid' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'has a valid title' do
      post.title = 'A great title'
      expect(post).to be_valid
    end
  end
end
