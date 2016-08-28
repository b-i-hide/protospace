require 'rails_helper'

describe User do
   describe '#create' do
     describe 'legal case' do
       context 'create with completed data' do
         it "should create user with name, email, password" do
           user = create(:user)
           expect(user).to be_valid
         end
       end
     end

     describe 'illegal case' do
       context 'create with uncompleted data' do
         it "is invalid without a name" do
           user = build(:user, name: nil)
           user.valid?
           expect(user.errors[:name]).to include("can't be blank")
         end

         it "should contain email" do
           user = build(:user, email: nil)
           user.valid?
           expect(user.errors[:email]).to include("can't be blank")
         end

         it "should contain password" do
           user = build(:user, password: nil)
           user.valid?
           expect(user.errors[:password]).to include("can't be blank")
         end

         it "should be invalid with duplicated email address" do
           user = create(:user)
           another_user = build(:user, email: user.email)
           another_user.valid?
           expect(another_user.errors[:email]).to include("has already been taken")
         end

         it "should be contain more than 8 characters" do
           user = build(:user, password: '0000')
           user.valid?
           expect(user.errors[:password][0]).to include('is too short')
         end
       end
     end
  end
end
