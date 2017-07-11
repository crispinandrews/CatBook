require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign Out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign Up')
      fill_in('Petname', with: 'fido')
      fill_in('Email', with: 'test@example.com')
      fill_in('user_password', with: 'testtest')
      fill_in('Password Confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign Out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign In')
      expect(page).not_to have_link('Sign Up')
    end
  end

  context 'an invalid username' do
    scenario 'does not let you submit a name that is taken' do
      sign_up
      sign_out
      sign_up
      expect(page).to have_content 'Petname has already been taken'
    end
  end
end

feature 'Profile' do
  context 'Profile picture' do
    scenario 'user can successfully upload a photo' do
      sign_up
      visit_profile
      click_link "Add a profile picture"
      attach_file('user_image', "spec/files/images/businesscat.jpg")
      fill_in "user_current_password", with: "testtest"
      click_button "Update"
      expect(page).to have_text "Your account has been updated successfully."
    end
  end
end
