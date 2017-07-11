require 'rails_helper'

feature 'posts' do

  before do
    sign_up
    @user = User.create(email: 'abc@123.com', password: '123456')
  end

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No Posts'
      expect(page).to have_link 'Create a Post'
    end
  end

  context 'adding a post' do
    scenario 'lets a user add a text post' do
      add_post('Miaow miaow')
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Miaow miaow'
    end
  end

  context 'editing posts' do
    scenario 'lets a user edit a post' do
      add_post('Miaow miaow')
      expect(current_path).to eq '/posts'
      edit_post('Gorgeous cat cat')
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Gorgeous cat cat'
      expect(page).not_to have_content 'Kitty cat'
    end
  end

  context 'deleting posts' do
    scenario 'removes a post when a user clicks delete' do
      add_post('Kitty cat')
      click_link 'Delete'
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Post deleted'
      expect(page).not_to have_content 'Kitty cat'
    end
  end

end
