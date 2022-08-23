require 'rails_helper'

RSpec.describe 'Home page', type: :system do
  
  it 'shows the names of the users' do
    visit('http://localhost:3000/')
    expect(page).to have_content('Tom') 
    expect(page).to have_content('John')
    expect(page).to have_content('Jane') 
    expect(page).to have_content('Joe')
    expect(page).to have_content('Jill')
  end

  it 'shows profile picture' do
    visit('http://localhost:3000/')
    expect(page).to have_xpath("//img[@alt='Tom']")
    expect(page).to have_xpath("//img[@alt='John']")
    expect(page).to have_xpath("//img[@alt='Jane']")
    expect(page).to have_xpath("//img[@alt='Joe']")
    expect(page).to have_xpath("//img[@alt='Jill']")
  end

  it 'shows numbers of posts' do
    visit('http://localhost:3000/')
    expect(page).to have_content('Number of posts: 5')
    expect(page).to have_content('Number of posts: 5')
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Number of posts: 0')
  end

  it 'shows link to show#user' do
    visit('http://localhost:3000/')
    expect(page).to have_link('Tom', href: '/users/1')
    expect(page).to have_link('John', href: '/users/2')
    expect(page).to have_link('Jane', href: '/users/3')
    expect(page).to have_link('Joe', href: '/users/4')
    expect(page).to have_link('Jill', href: '/users/5')
  end
end