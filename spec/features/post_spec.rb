require 'rails_helper'

RSpec.describe 'Post page', type: :system do
  
  it 'shows the names of the users' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Tom') 
  end

  it 'shows profile picture of User id:1' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_xpath("//img[@alt='Tom']")
  end

  it 'shows numbers of posts' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Number of Posts: 16')
  end

  it 'show post title' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('My first Post')
  end 

  it 'show post content' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('This is my first post!')
  end

  it 'show first comment of post' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Hello')
  end

  it 'show how many comments of post' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Number of comments: 2')
  end

  it 'show how many likes of post' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Number of likes: 1')
  end

  it 'shows link to show#posts' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_link('My first Post', href: '/users/1/posts/11')
  end

end