class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user       , null: false, foreign_key: true
      t.string     :firstname         , null: false
      t.string     :lastname          , null: false
      t.string     :firstname_kana    , null: false
      t.string     :lastname_kana     , null: false
      t.string     :post_number, null: false
      t.string     :prefecture_id, null: false
      t.string     :local      , null: false
      t.string     :local_number, null: false
      t.string     :building
      t.string     :tel_number
      t.timestamps
    end
  end
end

