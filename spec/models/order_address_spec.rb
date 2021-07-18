require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
    end

    context '購入できる時' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない時' do
      it 'postal_codeが空だと購入できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeに半角ハイフンがないと購入できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'postal_codeが全角だと購入できないこと' do
        @order_address.postal_code = '１２３−４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが選択されていないと購入できないこと' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと購入できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと購入できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁未満だと購入できないこと' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが11桁より大きいと購入できないこと' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberに半角数値意外が含まれていると購入できないこと' do
        @order_address.phone_number = '090-123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが全角だと購入できないこと' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空だと購入できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
