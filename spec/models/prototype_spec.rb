require 'rails_helper'

describe Prototype do
  context 'associations' do
    let(:user){ FactoryGirl.create(:user) }
    before { @prototype = user.prototype.build(:prototype) }

    subject{ @prototype }

    it{ should respond_to(:user_id) }
    it{ should respond_to(:user) }
    it(:user){ should eq user }
  end
end
