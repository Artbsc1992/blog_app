require 'rails_helper'

RSpec.describe 'Post', type: :system do
  it 'shows the post title' do
    visit('http://localhost:3000/users/1/posts/5')
    expect(page).to have_content('Lorem ipsum dolor sit amet, consectetur adipiscing elit')
  end

  it 'displays who wrote the post' do
    visit('http://localhost:3000/users/1/posts/5')
    expect(page).to have_content('Tom')
  end

  it 'shows how many comments the post has' do
    visit('http://localhost:3000/users/1/posts/5')
    expect(page).to have_content('Comments: 4')
  end

  it 'shows how many likes the post has' do
    visit('http://localhost:3000/users/1/posts/5')
    expect(page).to have_content('Likes: 0')
  end

  it 'shows posts body' do
    visit('http://localhost:3000/users/1/posts/5')
    expect(page).to have_content('Lorem ipsum dolor sit amet')
  end

  it 'shows the names of each commentor' do
    visit('http://localhost:3000/users/1/posts/5')
    expect(page).to have_content('Jane')
    expect(page).to have_content('Joe')
    expect(page).to have_content('Jane')
    expect(page).to have_content('Jill')
  end
  it 'shows the comments the post has' do
    visit('http://localhost:3000/users/1/posts/5')
    expect(page).to have_content('Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in.!')
    expect(page).to have_content('Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales')
    expect(page).to have_content('Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in.!')
    expect(page).to have_content('In dictum non consectetur a erat nam!')
  end
end
