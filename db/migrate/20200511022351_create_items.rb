class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,                null: false
      t.text       :description,         null: false
      t.integer    :category_id,         null: false
      t.string     :brand,               null: false
      t.string     :condition_id,        null: false
      t.string     :prefecture_id,       null: false
      t.string     :size
      t.integer    :price        , null: false
      t.integer    :shipping_days_id, null: false
      t.string     :postage_id      , null: false
      t.string     :status_id   
      # t.string     :seller_id         , null: false, foreign_key: true
      # t.string     :buyer_id          ,foreign_key: true
      t.timestamps
    end
  end
end
