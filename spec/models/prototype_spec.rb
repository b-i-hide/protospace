require 'rails_helper'

describe Prototype do
  describe'associations' do
    context 'with comment' do
      it "is valid to delete comments when delete prototype" do
        prototype = create(:prototype)
        comment = create(:comment, prototype: prototype)
        expect{prototype.destroy}.to change{Comment.count}
      end
    end

    context 'with likes' do
      it "is valid to delete likes when delete prototype" do
        prototype = create(:prototype)
        like = create(:like, prototype: prototype)
        expect{ prototype.destroy }.to change{ Like.count }
      end
    end
  end

  describe 'validations' do
    context 'with valid attributes' do
      it "has a valid factory" do
        prototype = build(:prototype)
        expect(prototype).to be_valid
      end
    end

    context 'without valid attributes' do
      it "is invalid without title" do
        prototype = build(:prototype, name: nil)
        prototype.valid?
        expect(prototype.errors[:name]).to include( "can't be blank" )
      end

      it "is invalid without catch_copy" do
        prototype = build(:prototype, catch_copy: nil)
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include( "can't be blank" )
      end

      it "is invalid without concept" do
        prototype = build(:prototype, concept: nil)
        prototype.valid?
        expect(prototype.errors[:concept]).to include( "can't be blank" )
      end
    end

    describe '#posted_date' do
      it "returns dates in a specified format" do
        prototype = build(:prototype, created_at: '2016-08-21 16:50:28')
        expect(prototype.posted_date).to eq('Aug 21')
      end
    end

    describe '#like_user(user)' do
      context 'when liked by a user' do
        it "returns true" do
          user = create(:user)
          prototype = create(:prototype, user: user)
          like = create(:like, prototype: prototype, user: user)
          expect(prototype.like_user(user)).to be_truthy
        end
      end

      context 'when not liked by a user' do
        it "returns false" do
          user = create(:user)
          prototype = create(:prototype, user: user)
          expect(prototype.like_user(user)).to be_falsey
        end
      end
    end
  end
end
