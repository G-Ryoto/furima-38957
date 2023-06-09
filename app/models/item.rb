class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :user
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_date
  
  attribute :price, :integer
  attribute :status_id, :integer
  attribute :shipping_date_id, :integer
  attribute :shipping_charge_id, :integer
  attribute :prefecture_id, :integer
  attribute :user_id, :integer
  has_one_attached :image

   validates :category_id,  numericality: { other_than: 0 } 
   validates :prefecture_id,  numericality: { other_than: 0 } 
   validates :image, presence: true
   validates :product_name, presence: true, length: { maximum: 40 }
   validates :product_explanation, presence: true, length: { maximum: 1000 }
   validates :shipping_charge_id,  numericality: { other_than: 1 } 
   validates :shipping_date_id,  numericality: { other_than: 1 } 
   validates :status_id,  numericality: { other_than: 1 } 
   validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
  


end
