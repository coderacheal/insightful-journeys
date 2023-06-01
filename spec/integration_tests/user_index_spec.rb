require 'rails_helper'

RSpec.describe User, type: :system do

    before (:each) do
      @user = User.create(name: 'Racheal', photo: 'a photo of me',
        bio: 'I am a software engineer', posts_counter: 0)
    end 
  
    describe 'User index page' do
        
        it "should check the username of all users" do
            visit user_index_path
            expect(page).to have_content(@user.name)
        end

        it "should check the photo of the user" do
            visit user_index_path
            expect(page).to have_content(@user.photo)
        end
        
    end
end