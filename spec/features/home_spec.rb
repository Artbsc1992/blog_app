require 'rails_helper'

RSpec.describe 'Home page', type: :system do
  it 'shows the names of the users' do
    visit('http://localhost:3000/')
    expect(page).to have_content('Tom') 
    expect(page).to have_content('John') 
  end

end