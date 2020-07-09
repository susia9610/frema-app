crumb :root do
  link "トップページ", root_path
end

crumb :newUser do
  link "本人情報入力", new_user_registration_path
  parent :root
end

crumb :newAddress do
  link "本人住所入力", new_user_registration_path
  parent :newUser
end

crumb :createUser do
  link "登録完了"
  parent :newAddress
end

crumb :mypage do 
  link "マイページ", mypage_index_path
end

crumb :creditcards do
  link "クレジットカード登録・削除", creditcard_path(current_user)
  parent :mypage
end

crumb :newCreditcards do
  link "クレジットカード情報入力"
  parent :creditcards
end

crumb :favorites do
  link "お気に入り商品", item_favorites_path(current_user)
  parent :mypage
end

crumb :address do
  link "発送元・お届け先住所変更", edit_address_path(current_user)
  parent :mypage
end

crumb :addressUpdate do
  link "変更完了"
  parent :address
end

crumb :detail do
  link "メールアドレス・パスワード変更", user_edit_detail_path(current_user)
  parent :mypage
end

crumb :detailUpdate do
  link "変更完了"
  parent :detail
end

crumb :logout do
  link "ログアウト"
  parent :mypage
end

crumb :itemShow do
  link "商品詳細情報", item_path(Item.ids)
  link Item.find(params[:id]).name, item_path(Item.ids)
  parent :root 
end

crumb :itemEdit do
  link "商品情報編集", edit_item_path
  parent :itemShow
end

crumb :itemUpdate do
  link "変更完了"
  parent :itemEdit
end

crumb :itemNew do
  link "商品出品", new_item_path
  parent :root
end

crumb :itemCreate do
  link "出品完了"
  parent :itemNew
end

crumb :purchase do
  link "購入内容の確認", purchase_item_path(Item.ids)
  parent :itemShow
end

crumb :done do
  link "購入完了"
  parent :purchase
end