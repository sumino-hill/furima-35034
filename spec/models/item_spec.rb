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
  end
end

