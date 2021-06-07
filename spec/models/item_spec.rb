require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品がうまくいく時' do
      it "全ての項目の入力が存在すれば登録できること" do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかない時' do
      it "imageがない場合は登録できないこと" do 
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameがない場合は登録できないこと" do 
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explainがない場合は登録できないこと" do 
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it "category_idがない場合は登録できないこと" do 
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "state_idがない場合は登録できないこと" do 
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "cost_idがない場合は登録できないこと" do 
        @item.cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it "prefecture_idがない場合は登録できないこと" do 
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipping_day_idがない場合は登録できないこと" do 
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "preiceがない場合は登録できないこと" do 
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "preiceが300未満の場合は登録できないこと" do 
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "preiceが9999999より上の場合は登録できないこと" do 
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "userが無い場合は登録できないこと" do 
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "価格は全角文字では登録できないこと
      " do 
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格は半角英数混合では登録できないこと" do 
        @item.price = 'a1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格は半角英語だけでは登録できないこと" do 
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end


