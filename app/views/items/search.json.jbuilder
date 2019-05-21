# 子要素
json.array! @m_cat do |m_cat|
  json.id   m_cat.id
  json.name m_cat.name
end

# 孫要素
json.array! @s_cat do |s_cat|
  json.id   s_cat.id
  json.name s_cat.name
end

#サイズ
# json.array! @size_cat do |size_cat|
#   json.id   size_cat.id
#   json.name size_cat.name
# end

#ブランド
# json.array! @b_cat do |b_cat|
#   json.id   b_cat.id
#   json.name b_cat.name
# end
