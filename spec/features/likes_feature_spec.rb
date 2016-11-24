require 'rails_helper'

feature 'liking posts' do
  before do
    sign_up
    add_post('This is a test post')
  end

  scenario 'a cat can like a post' do
    click_link 'Like'
    expect(page).to have_content('1 like') 
  end
end
