class ShippingCharge < ActiveHash::Base
  self.data = [
    { id: 1,  shipping_charge: '---' },
    { id: 2,  shipping_charge: '着払い(購入者負担)' },
    { id: 3,  shipping_charge: '送料込み(出品者負担)' },
              #カラム名
  ]
  include ActiveHash::Associations
  has_many :items
  has_many :orders
  end
  #ファイル名がモデル名