require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end
  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it "全ての項目の入力が存在すれば登録できること" do
        expect(@purchase_address).to be_valid
      end
      it "建物名がなくても登録できること" do
        @purchase_address.building = nil
        @purchase_address.valid?
        expect(@purchase_address).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it "Postal_codeがない場合は登録できないこと" do 
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "Postal_codeに-がない場合は登録できないこと" do 
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end

      it "prefecture_idがない場合は登録できないこと" do 
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityがない場合は登録できないこと" do 
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressesがない場合は登録できないこと" do 
        @purchase_address.addresses = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it "phone_numberがない場合は登録できないこと" do 
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが9桁以下の場合は登録できないこと" do 
        @purchase_address.phone_number = '12345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが12桁以上の場合は登録できないこと" do 
        @purchase_address.phone_number = '123456789101'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが全角の場合は登録できないこと" do 
        @purchase_address.phone_number = '１２３４５６７８９０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが文字の場合は登録できないこと" do 
        @purchase_address.phone_number = 'aaaaaaaaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "user_idが無い場合は登録できないこと" do 
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include()
      end
      it "item_idが無い場合は登録できないこと" do 
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include()
      end
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

