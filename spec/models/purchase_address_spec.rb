require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end
  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it "全ての項目の入力が存在すれば登録できること" do
        expect(@purchase_address).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it "Postal_codeがない場合は登録できないこと" do 
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
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
      
    end
  end
end

