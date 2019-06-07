crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :profile do
  link "プロフィール", user_profile_path
  parent :mypage
end

crumb :creditcards do
  link "支払い方法", creditcards_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", user_logout_path
  parent :mypage
end

crumb :items do
  @item = Item.find(params[:id])
  link "#{@item.name}", item_path
  parent :root
end



