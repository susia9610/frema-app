class Comment < ApplicationRecord
  validates :user_id, :item_id, :content,  presence: true
  belongs_to :item
  belongs_to :user 
end
