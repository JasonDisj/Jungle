require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'is valid when all the user info is given' do
      @user = User.new(name: 'Scarlett', email: 'scarlett@gmail.com', password: 'scarlett', password_confirmation: 'scarlett')
      expect(@user).to be_valid
    end

    it 'is not valid when the name is not given' do
      @user = User.new(name: nil, email: 'scarlett@gmail.com', password: 'scarlett', password_confirmation: 'scarlett')
      expect(@user).to_not be_valid
    end
  
    it 'is not valid when the email is not given' do
      @user = User.new(name: 'Scarlett', email: nil, password: 'scarlett', password_confirmation: 'scarlett')
      expect(@user).to_not be_valid
    end

    it 'is not valid when the password is not given' do
      @user = User.new(name: 'Scarlett', email: 'scarlett@gmail.com', password: nil, password_confirmation: 'scarlett')
      expect(@user).to_not be_valid
    end

    it 'is not valid when the password confirmation is not given' do
      @user = User.new(name: 'Scarlett', email: 'scarlett@gmail.com', password: 'scarlett', password_confirmation: nil)
      expect(@user).to_not be_valid
    end
  
    it 'is not valid when the password confirmation does not match the password' do
      @user = User.new(name: 'Scarlett', email: 'scarlett@gmail.com', password: 'scarlett', password_confirmation: 'scarlet')
      expect(@user).to_not be_valid
      puts 'ERROR MESSAGE', @user.errors.full_messages
    end

    it 'is not valid when the password is less than 6 characters' do
      @user = User.new(name: 'Scarlett', email: 'scarlett@gmail.com', password: 'scar', password_confirmation: 'scarlett')
      expect(@user).to_not be_valid
    end

    it 'is not valid when the email of a registering user is the same as another already-registered user' do
      @user1 = User.new(name: 'Scarlett', email: 'scarlett@gmail.com', password: 'scarlett', password_confirmation: 'scarlett')
      expect(@user1).to be_valid
      @user1.save

      @user2 = User.new(name: 'ScarlettJ', email: 'scarlett@gmail.com', password: 'scarlettj', password_confirmation: 'scarlettj')
      expect(@user2).to_not be_valid

    end
  end



  describe '.authenticate_with_credentials' do
    it 'is valid if the email with space and different-to-register case and password is correct' do
      @user = User.new(name: 'Scarlett', email: 'scarlett@gmail.com', password: 'scarlett', password_confirmation: 'scarlett')
      @user.save
      expect(User.authenticate_with_credentials('   ScarLett@Gmail.com   ', 'scarlett')).to eq(@user)
    end
  end
end