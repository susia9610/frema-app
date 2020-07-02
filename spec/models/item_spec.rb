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
      expect(item.errors[:name]).to include("can't be blank")
    end
    
    it "商品名(name)が40文字を超える場合は登録できないこと" do
      item = build(:item, name: "あああああいいいいいうううううえええええおおおおおあああああいいいいいうううううえ")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "商品名(name)が40文字であれば登録できること" do
      item = create(:item, name: "ああああああああああいいいいいいいいいいううううううううううええええええええええ")
      expect(item).to be_valid
    end

    it "販売価格がない場合は登録できないこと" do
      item = build(:item, price:"")
      item.valid?
      expect(item.errors[:price]).to include("can't_be blank")
    end 
    
    it "販売価格(price)が300円未満の場合は登録できないこと" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "販売価格(price)が10,000,000円以上の場合は登録できないこと" do
      item = bulid(:item, price: 10000000)
      item.valid?
      expect(item.errors[:prise]).to include("must be less than or equal to 9999999")
    end

    it "説明(description)がない場合は登録できないこと" do 
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "カテゴリー(category_id)がない場合は登録できないこと" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end
    
    it "商品状態(condition_id)がない場合は登録できないこと" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "配送料の負担（postage_id)がない場合は登録できないこと" do
      item = build(:item, postage_id: "")
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

  descride '#update' do
    it "商品名（name）がない場合は更新できないこと" do
      item = build(item_edit)
      item.update(name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "販売価格(price)がない場合は更新できないこと" do
      item = build(:item_edit)
      item.update(price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "販売価格(price)が300円未満の場合は更新できないこと" do
      item = build(:item_edit)
      item.update(price: 299)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "販売価格(price)が10,000,000円以上の場合は更新できないこと" do
      item = build(:item_edit)
      item.update(price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "説明(description)がない場合は更新できないこと" do
      item = build(:item_edit)
      item.update(description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "カテゴリ(category_id)がない場合は更新できないこと" do
      item = build(:item_edit)
      item.update(category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "商品の状態(condition_id)がない場合は更新できないこと" do
      item = build(:item_edit)
      item.update(condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "配送料の負担(postage_id)がない場合は更新できないこと" do
      item = build(:item_edit)
      item.update(postage_id: "")
      item.valid?
      expect(item.errors[:postage_id]).to include("can't be blank")
    end

    it "発送元の地域(prefecture_id)がない場合は更新できないこと" do
      item = build(:item_edit)
      item.update(prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "発送までの日数(shipping_days_id)がない場合は更新できないこと" do
      item = build(:item_edit)
      item.update(shipping_days_id: "")
      item.valid?
      expect(item.errors[:shipping_days_id]).to include("can't be blank")
    end

    it "画像(image)がない場合は更新できないこと" do
      item = build(:item_edit_no_image)
      item.valid?
      expect(item.errors[:images]).to include("can't be blank")
    end
  end
end 