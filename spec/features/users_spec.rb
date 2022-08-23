require 'rails_helper'

RSpec.describe 'User page', type: :system do
  
  it 'shows the names of the users' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('Tom') 
  end

  it 'shows profile picture of User id:1' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_xpath("//img[@alt='Tom']")
  end

  it 'shows numbers of posts' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('Number of Posts: 16')
  end

  it 'shows user bio' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('Exercitation')
  end

  it 'shows link to show#user' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_link('Tom', href: '/users/1')
  end

  it 'shows link to index#post' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_link('See all posts', href: '/users/1/posts')
  end 

  it 'It redirect to each post' do 
    visit('http://localhost:3000/users/1')
    expect(page).to have_link('Hello', href: '/users/1/posts/21')
  end

  it 'link redirect to index#post' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_link('', href: '/users/1/posts')
  end 
end