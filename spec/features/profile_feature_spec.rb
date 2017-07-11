require 'rails_helper'

feature 'profile' do

  before do
    sign_up
  end

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/'
      click_link 'Your Profile'
      expect(page).to have_content 'fido'
      expect(page).to have_content 'No Posts'
      expect(page).to have_link 'Add your hometown'
      expect(page).to have_link 'Add your hobbies'
    end
  end
end
