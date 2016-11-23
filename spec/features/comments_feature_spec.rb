require 'rails_helper'



feature 'comments' do
  before do
    sign_up
    add_post('Great looking Kitten')
  end

  scenario 'allow users to leave a comment using a form' do
    visit '/posts'
    click_link 'Comments'
    fill_in "Comments", with: 'No its not'
    click_button 'Leave Comment'
    expect(current_path).to eq '/posts/1'
    expect(page).to have_content('No its not')
  end
end
