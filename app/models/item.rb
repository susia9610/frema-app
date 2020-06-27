class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  belongs_to :category
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  belongs_to :seller, class_name: "User", foreign_key: "seller_id", optional: true
  has_many   :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, :description, :condition_id, :postage_id, :prefecture_id, :shipping_days_id, :price, presence: true
  validates :price, numericality: { only_integer: true , greater_than: 0, less_than: 9999999 }
end