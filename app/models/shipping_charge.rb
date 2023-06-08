class ShippingCharge < ActiveHash::Base
  self.data = [
    { id: 1,  item_shipping: '---' },
    { id: 2,  item_shipping: '着払い' },
    { id: 3,  item_shipping: '送料込み' },
  ]
  include ActiveHash::Associations
  has_many :items
  end