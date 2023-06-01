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
    
   describe 'specific user show page' do
      it 'should check for user photo' do
        visit user_path(@user.id)
        expect(page).to have_css('div', text: @user.photo)
      end
      it 'should check for user name' do
        visit user_path(@user.id)
        expect(page).to have_css('h1', text: @user.name)
      end
      it 'should check for the user\'s image' do
        visit user_path(@user.id)
        expect(page).to have_content(@user.photo)
      end
      it 'should check for number of post' do
        visit user_path(@user.id)
        expect(page).to have_content('Number of posts: 4')
      end
      it 'should check for users bio' do
        visit user_path(@user.id)
        expect(page).to have_content(@user.bio)
      end
      it 'should check for users bio' do
        visit user_path(@user.id)
        expect(page).to have_css('p', text:'Integration test with Capybara and Selenium web drivers')
      end
      it 'should check for users bio' do
        visit user_path(@user.id)
        expect(page).to have_link('All Posts')
      end
      # it 'should check for the user\'s image' do
      #   visit user_path(@user.id)
      #   sleep(3)
      #   expect(page).to have_content(@user.name)
      # end
    end

    
end
