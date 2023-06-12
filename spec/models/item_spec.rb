require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
   before do
    @item = FactoryBot.build(:item)
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
       it 'カテゴリーに「---」が選択されている場合は出品できない' do
         @item.category_id = '0'
         @item.valid?
         expect(@item.errors.full_messages).to include("Category must be other than 0")
        end
       it '商品の状態に「---」が選択されている場合は出品できない' do
         @item.status_id = '1'
         @item.valid?
         expect(@item.errors.full_messages).to include("Status must be other than 1")
       end 
       it '配送料の負担に「---」が選択されている場合は出品できない' do
          @item.shipping_charge_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end
       it '発送元の地域に「---」が選択されている場合は出品できない' do
         @item.prefecture_id = '0'
         @item.valid?
         expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
       end
       it '発送までの日数に「---」が選択されている場合は出品できない' do
         @item.shipping_date_id = '1'
         @item.valid?
         expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
       end
      it '価格は半角数値で入力されていない場合登録できない' do
        @item.price = '１０００ '
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
       it '価格が10_000_000円を超えると出品できない' do
         @item.price = '10_000_000_000'
         @item.valid?
         expect(@item.errors.full_messages).to include("Price Out of setting range")
       end
        it '商品価格が299円以下では出品できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end 
       it 'userが紐付いていなければ出品できない' do
         @item.user = nil
         @item.valid?
         expect(@item.errors.full_messages).to include("User must exist")
       end
       it '価格がからでは登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
       end 
    end
  end 
end

