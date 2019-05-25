# 子要素（2番目のカテゴリー）
json.array! @m_cat do |m_cat|
  json.id   m_cat.id
  json.name m_cat.name
end

# 孫要素（3番目のカテゴリー）
json.array! @s_cat do |s_cat|
  json.id   s_cat.id
  json.name s_cat.name
end
