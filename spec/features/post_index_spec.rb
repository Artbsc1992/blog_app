require 'rails_helper'

RSpec.describe 'Post', type: :system do
  it 'shows the post title' do
    visit('http://localhost:3000/users/1/posts/11')
    expect(page).to have_content('My first post')
  end
=begin 
  it 'displays who wrote the post' do
    visit('http://localhost:3000/users/136/posts/140')
    expect(page).to have_content('Lilly')
  end

  it 'shows how many comments the post has' do
    visit('http://localhost:3000/users/136/posts/140')
    expect(page).to have_content('Comments: 11')
  end

  it 'shows how many likes the post has' do
    visit('http://localhost:3000/users/136/posts/140')
    expect(page).to have_content('Likes: 2') 
  end

  it 'shows posts body' do
    visit('http://localhost:3000/users/136/posts/140')
    expect(page).to have_content('Lorem ipsum')
  end

  it 'shows the names of each commentor' do
    visit('http://localhost:3000/users/136/posts/140')
    expect(page).to have_content('Tom')
    expect(page).to have_content('Josh')
  end

  it 'shows the comments the post has' do
    visit('http://localhost:3000/users/136/posts/140')
    expect(page).to have_content('this is my sixth comment six')
    expect(page).to have_content('this is my fifth comment five')
    expect(page).to have_content('this is my fourth comment four')
    expect(page).to have_content('this is my third comment three')
    expect(page).to have_content('this is my second comment two')
    expect(page).to have_content('this is my first comment one')
    expect(page).to have_content('nice post')
    expect(page).to have_content('other comment')
    expect(page).to have_content('ab')
    expect(page).to have_content('dd')
    expect(page).to have_content('Hey you!')
  end 
=end
end
