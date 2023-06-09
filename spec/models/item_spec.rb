require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
   before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/furima.png')
   end

     describe '出品機能' do
    context '出品ができる時' do
      it "必須項目が全てあれば登録できること" do
        expect(@item).to be_valid
      end
      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
        @item = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end




     context "商品出品ができない時" do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_explanationが空では登録できない' do
        @item.product_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product explanation can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'statusが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it 'shipping_chargeが空では登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge is not a number")
      end
      it 'prefectureが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'shipping_dateが空では登録できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date is not a number")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      
    end
  end 
end


