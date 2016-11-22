require 'rails_helper'

feature 'posts' do

  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/posts'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Create a post'
    end
  end

  context 'adding a post' do
    scenario 'lets a user add a post' do
      visit '/posts'
      click_link 'Create a post'
      fill_in 'text', with: "Miaow miaow"
      click_link 'Submit'
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Miaow miaow'
    end
  end
end
