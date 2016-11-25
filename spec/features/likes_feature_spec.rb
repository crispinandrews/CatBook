require 'rails_helper'

feature 'liking posts' do
  before do
    sign_up
    add_post('This is a test post')
  end

  scenario 'a cat can like a post', js: true do
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  scenario 'a cat can hiss a post', js: true do
    click_link 'Hiss'
    expect(page).to have_content('-1 like')
  end

  scenario 'a cat can only like a post once', js: true do
    click_link 'Like'
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content ('1 like')
  end


  # scenario 'a cat and like a commment', js: true do
  #   click_link 'Comments'
  #   fill_in 'Comments', with: 'This is a comment'
  #   click_button 'Leave Comment'
  #   click_link 'like-comment'
  #   expect(page).to have_content('1 like')
  # end
end
