class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user,             null: false, foreign_key: true
      t.string     :family_name,      null: false
      t.string     :first_name,       null: false
      t.string     :family_name_kana, null: false
      t.string     :first_name_kana,  null: false
      t.string     :post_number,      null: false
      t.string     :prefecture ,      null: false
      t.string     :local,            null: false
      t.string     :localnumber,      null: false
      t.string     :building,         null: false
      t.integer    :tel_number
      t.timestamps
    end
  end
end
