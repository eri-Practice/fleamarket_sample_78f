require 'rails_helper'
describe Item do
  describe '#create' do
    it "必須項目の記入で保存ができる" do
      expect(build(:item)).to be_valid
    end

    it "nameがないと出品不可" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
   
    it "textがないと出品不可" do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include("を入力してください")
    end

    it "priceがないと出品不可" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "categoryがないと出品不可" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end
    
    it "conditionがないと出品不可" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end
    
    it "postage_payerがないと出品不可" do
      item = build(:item, postage_payer: nil)
      item.valid?
      expect(item.errors[:postage_payer]).to include("を入力してください")
    end
    
    it "prefecture_idがないと出品不可" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end
    
    it "standby_dayがないと出品不可" do
      item = build(:item, standby_day: nil)
      item.valid?
      expect(item.errors[:standby_day]).to include("を入力してください")
    end
    
    it "trading_statusがないと出品不可" do
      item = build(:item, trading_status: nil)
      item.valid?
      expect(item.errors[:trading_status]).to include("を入力してください")
    end
   
    it "sellerがないと出品不可" do
      item = build(:item, seller: nil)
      item.valid?
      expect(item.errors[:seller]).to include("を入力してください")
    end

  end
end