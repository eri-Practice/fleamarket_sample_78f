require 'rails_helper'

describe Image do
  describe '#create' do

    it "画像が保存できる" do
      image = build(:image)
      expect(image).to be_valid
    end

  end
end
