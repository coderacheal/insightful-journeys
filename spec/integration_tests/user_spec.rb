require 'rails_helper'

RSpec.describe User, type: :system do

    before (:each) do
      @user = User.create(name: 'Racheal', photo: 'a photo of me',
        bio: 'I am a software engineer', posts_counter: 0)

      @post_1  =  Post.create(author: @user, title: 'Still testing Capybara', text: 'Integration test with Capybara and Selenium web drivers', comments_counter: 3, likes_counter: 7)
      @post_2  =  Post.create(author: @user, title: 'Still testing Capybara', text: 'Integration test with Capybara and Selenium web drivers', comments_counter: 3, likes_counter: 7)
      @post_3  =  Post.create(author: @user, title: 'Still testing Capybara', text: 'Integration test with Capybara and Selenium web drivers', comments_counter: 3, likes_counter: 7)
      @post_4  =  Post.create(author: @user, title: 'Still testing Capybara', text: 'Integration test with Capybara and Selenium web drivers', comments_counter: 3, likes_counter: 7)
    end 
  
    describe 'User index page' do
        
        it "should check the username of all users" do
            visit users_path
            expect(page).to have_content(@user.name)
        end

        it "should check the photo of the user" do
            visit users_path
            expect(page).to have_content(@user.photo)
        end
        
        it 'should check the number of post for the user' do
          visit users_path
          expect(page).to have_content(@user.posts_counter = 0)
        end
        
    end


    
end