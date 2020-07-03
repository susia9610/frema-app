class Comment < ApplicationRecord
  validates :user_id, :item_id, :text,  presence: true
  belongs_to :item
  belongs_to :user 
end
