require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @person = User.create(name: 'Racheal', photo: 'a photo of me',
                          bio: 'I am a software engineer')
  end

  describe 'validations' do
    it 'should validate the presence of name' do
      @person.name = nil
      expect(@person).to_not be_valid
    end

    it 'should validate that post count is an integer' do
      @person.posts_counter = '5'
      expect(@person).to_not be_valid
    end
  end

  describe 'associations' do
    it 'should have many posts' do
      expect(@person.posts).to eq([])
    end

    it 'should have many comments' do
      expect(@person.comments).to eq([])
    end

    it 'should have many likes' do
      expect(@person.likes).to eq([])
    end
  end
end
