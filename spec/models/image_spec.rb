require 'rails_helper'

include ActionDispatch::TestProcess

describe Image do
  describe '#create' do
    it "has the wrong content format" do
      image = build(:image, :main, image: fixture_file_upload('img/sample.pdf'))
      image.valid?
      expect(image.errors[:image]).to include("can't be blank")
    end

    context 'with a valid factory' do
      it "has a valid factory" do
        image = build(:image, :main)
        expect(image).to be_valid
      end
    end

    context 'without image attribute' do
      it "returns error" do
        image = build(:image, :main, image: nil)
        image.valid?
        expect(image.errors[:image]).to include("can't be blank")
      end
    end

    context 'without status attributes' do
      it "returns error" do
        image = build(:image)
        image.valid?
        expect(image.errors[:status]).to include("can't be blank")
      end
    end
  end
end
