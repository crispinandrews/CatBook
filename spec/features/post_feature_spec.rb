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
      fill_in 'Text', with: "Miaow miaow"
      click_button 'Create Post'
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Miaow miaow'
    end
  end

  context 'viewing posts' do
    let!(:kitty){ Post.create(text:'Kitty cat') }
    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Kitty cat'
      expect(page).to have_content 'Kitty cat'
      expect(current_path).to eq "/posts/#{kitty.id}"
    end
  end
end
