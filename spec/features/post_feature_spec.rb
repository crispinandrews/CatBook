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
    scenario 'lets a user add a text post' do
      visit '/posts'
      click_link 'Create a post'
      fill_in 'post_text', with: "Miaow miaow"
      click_button 'Create post'
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

  context 'editing posts' do
    before { Post.create(text: 'Kitty cat') }
    scenario 'lets a user edit a post' do
      visit '/posts'
      click_link 'Kitty cat'
      click_link 'Edit'
      fill_in 'post_text', with: 'Gorgeous cat cat'
      click_button 'Edit post'
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Gorgeous cat cat'
      expect(page).not_to have_content 'Kitty cat'
    end
  end

  context 'deleting posts' do
    before { Post.create(text: 'Kitty cat') }
    scenario 'removes a post when a user clicks delete' do
      visit '/posts'
      click_link 'Kitty cat'
      click_link 'Delete'
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Post deleted successfully'
      expect(page).not_to have_content 'Kitty cat'
    end
  end

end
