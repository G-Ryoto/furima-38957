class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
 
    # テーブルとのアソシエーション
  has_one :order
  
  
  belongs_to :category
  belongs_to :status
  belongs_to :user
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_date
  
  has_one_attached :image

   validates :category_id,  numericality: { other_than: 0 } 
   validates :prefecture_id,  numericality: { other_than: 0 } 
   validates :image, presence: true
   validates :product_name, presence: true, length: { maximum: 40 }
   validates :product_explanation, presence: true, length: { maximum: 1000 }
   validates :shipping_charge_id,  numericality: { other_than: 1 } 
   validates :shipping_date_id,  numericality: { other_than: 1 } 
   validates :status_id,  numericality: { other_than: 1 } 
   validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }

   # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 0 } do
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_date_id
  end



end
