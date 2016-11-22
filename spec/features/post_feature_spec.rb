require 'rails_helper'

feature 'posts' do

  before do
    sign_up
  end

  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/posts'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Create a post'
    end
  end

  context 'adding a post' do
    scenario 'lets a user add a text post' do
      add_post('Miaow miaow')
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Post saved successfully'
      expect(page).to have_content 'Miaow miaow'
    end
  end

  context 'viewing posts' do
    let!(:kitty){ Post.create(text:'Kitty cat') }
    scenario 'lets a user view a post' do
      visit_post('Kitty cat')
      expect(current_path).to eq "/posts/#{kitty.id}"
      expect(page).to have_content 'Kitty cat'
    end
  end

  context 'editing posts' do
    before { Post.create(text: 'Kitty cat') }
    scenario 'lets a user edit a post' do
      visit_post('Kitty cat')
      edit_post('Gorgeous cat cat')
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Post updated successfully'
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
