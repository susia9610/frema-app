class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  has_many   :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :description, :category, :condition, :postage, :prefecture, :shipping_days, :price, presence: true
  validates :price, numericality: { only_integer: true , greater_than: 0, less_than: 9999999 }
end

