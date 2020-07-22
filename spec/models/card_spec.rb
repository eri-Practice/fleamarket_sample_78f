require 'rails_helper'

RSpec.describe Card, type: :model do
  describe Item do
    describe '#create' do

      it "全てのカラムがある時保存できる" do
        card = build(:card)
        expect(card).to be_valid
      end

      it "customer_id なしだと保存不可" do
        card = build(:card, customer_id: nil)
        card.valid?
        expect(card.errors[:customer_id]).to include("を入力してください")
      end

      it "card_id なしだと保存不可" do
        card = build(:card, card_id: nil)
        card.valid?
        expect(card.errors[:card_id]).to include("を入力してください")
      end

    end
  end
end
