class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user, optional: true

  with_options presence: true do
    validates :prefecture_id
    validates :local
    validates :local_number
    validates :post_number,   format: {with: /\A\d{3}[-]\d{4}\z/}
   
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :firstname
      validates :lastname
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :firstname_kana
      validates :lastname_kana
    end
  end
end


