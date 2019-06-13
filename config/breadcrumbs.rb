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

crumb :searchkeyword do |keyword|
  link "#{keyword[:name_cont]}"
end

crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end



