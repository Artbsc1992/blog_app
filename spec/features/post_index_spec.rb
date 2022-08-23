require 'rails_helper'

RSpec.describe 'Post', type: :system do
  it 'shows the post title' do
    visit('http://localhost:3000/users/1/posts/11')
    expect(page).to have_content('My first post')
  end

  it 'displays who wrote the post' do
    visit('http://localhost:3000/users/1/posts/11')
    expect(page).to have_content('Tom')
  end
  
  it 'shows how many comments the post has' do
    visit('http://localhost:3000/users/1/posts/11')
    expect(page).to have_content('Comments: 2')
  end
  
  it 'shows how many likes the post has' do
    visit('http://localhost:3000/users/1/posts/11')
    expect(page).to have_content('Likes: 1') 
  end
  
  it 'shows posts body' do
    visit('http://localhost:3000/users/1/posts/11')
    expect(page).to have_content('This is my first post!')
  end
  
  it 'shows the names of each commentor' do
    visit('http://localhost:3000/users/1/posts/11')
    expect(page).to have_content('Tom')
  end
  it 'shows the comments the post has' do
    visit('http://localhost:3000/users/1/posts/11')
    expect(page).to have_content('Hello')
    expect(page).to have_content('Hello Hello')
  end 
end
