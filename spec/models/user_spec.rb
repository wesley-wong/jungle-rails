require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validation' do

    describe 'User.save' do
      it 'should save given a valid user' do
        @user = User.new(
          first_name: 'Bruce',
          last_name: 'Wayne',
          email: 'bat@man.com',
          password: "I'm batman",
          password_confirmation: "I'm batman"
          )

        expect(@user.save).to be true
      end

      it 'email should be required' do
        @user = User.create(
          first_name: 'Bruce',
          last_name: 'Wayne',
          email: nil,
          password: "I'm batman",
          password_confirmation: "I'm batman"
          )
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'first_name should be required' do
        @user = User.create(
          first_name: nil,
          last_name: 'Wayne',
          email: 'bat@man.com',
          password: "I'm batman",
          password_confirmation: "I'm batman"
          )
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name should be required' do
        @user = User.create(
          first_name: 'Bruce',
          last_name: nil,
          email: 'bat@man.com',
          password: "I'm batman",
          password_confirmation: "I'm batman"
          )
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'should not save if passwords do not match' do
        @user = User.create(
          first_name: 'Bruce',
          last_name: 'Wayne',
          email: 'bat@man.com',
          password: "I'm batman",
          password_confirmation: "I'm not batman"
          )
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'should not save if email is in database (case insensitive)' do
        @user = User.create(
          first_name: 'Bruce',
          last_name: 'Wayne',
          email: 'bat@man.com',
          password: "I'm batman",
          password_confirmation: "I'm batman"
          )
        @user2 = User.create(
          first_name: 'Bruce',
          last_name: 'Wayne',
          email: 'BAT@man.com',
          password: "I'm batman",
          password_confirmation: "I'm batman"
          )
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end

      it 'password is longer than 3 characters' do

      end
    end
  end
end
