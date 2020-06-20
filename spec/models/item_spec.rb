require 'rails _helper'

RSpec.describe Item, type: :model do
  describe '#create' do 

    it "全て入力すると登録できる" do
      item = create(:item)
      expect(item).to be_valid
    end 
    
    it "商品名(name)がないと登録できないこと" do
      item = build(:item, name:"")
      item.valid?
      expect(item.errors[:name]).to inclide("can't be blank")
    end
    
    it "商品名が(name)があれば登録できること" do
      item = create(item, name: "ああああああああああいいいいいいいいいいううううううううううええええええええええ")
      item.valid?
      expect{item}.to be_valid
    end 

    it "販売価格がない場合は登録できないこと" do
      item = build(item, price:"")
      item.valid?
      expect(item.errors[:price]).to include("can't_be blank")
    end 
    
    it "販売価格(price)が300円未満の場合は登録できないこと" do
      item = build(item, price: 299)
      item.valid?
      expect(item.errors[price]).to inclide("must be greater than or equal to 300")
    end
    
    it "説明(description)がない場合は登録できないこと" do 
      item = build(item, description: "")
      item.valid?
      expect(item.errors[description]).to inclide("can't be blank")
    end

    it "カテゴリー(category_id)がない場合は登録できないこと" do
      item = build(item, category_id: "")
      item.valid?
      expect(item.errors[category_id]).to inclide("can't be blank")
    end
    
    it "商品状態(condition_id)がない場合は登録できないこと" do
      item = build(item, category_id: "")
      item.valid?
      expect(item.errors[category_id]).to inclide("can't be blank")
    end

    it "配送料の負担（postage_id)がない場合は登録できないこと"
      item = build(item, postage_id: "") do
      item.valid?
      expect(item.errors[:postage_id]).to inclide("can't be blank")
    end
    
    it "発送元の地域(prefecture_id)がない場合は登録できないこと" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "発送までの日数(shipping_days_id)がない場合は登録できないこと" do
      item = build(:item, shipping_days_id: "")
      item.valid?
      expect(item.errors[:shipping_days_id]).to include("can't be blank")
    end

    it "画像(image)がない場合は登録できないこと" do
      item_no_image = build(:item_no_image)
      item_no_image.valid?
      expect(item_no_image.errors[:images]).to include("can't be blank")
    end
  end
end 