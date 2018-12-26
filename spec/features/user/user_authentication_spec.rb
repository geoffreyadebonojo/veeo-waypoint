require 'rails_helper'

RSpec.feature 'User authentication' do 
  before do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
  end
  
  describe 'User can login' do
    it 'via google aouth' do
      expect(current_path).to eq('/topics')
    end
  end
  
  describe 'User can logout' do 
    it 'from the navbar' do 
      click_on 'Logout'
      
      expect(current_path).to eq('/')
    end 
  end 
end


