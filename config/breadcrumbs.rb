crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link 'マイページ', user_path
end

crumb :items do
  link "ベルト", edit_item_path
end
