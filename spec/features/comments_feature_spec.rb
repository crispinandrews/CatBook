require 'rails_helper'



feature 'comments' do
  before do
    sign_up
    add_post('Great looking Kitten')
  end

  scenario 'allow users to leave a comment using a form' do
    visit '/posts'
    fill_in "comment_comments", with: 'No its not'
    click_button 'Comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content('No its not')
  end
end
