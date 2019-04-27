Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
end


# signup/　メール、FB、Gglでの新規登録選択
# signup/registration/　メアド等登録　（入力フォーム記載ミスなどあっても戻るだけ）
# signup/sms_confirmation/　電話番号の入力
# 　　signup/sms_confirmation/sms/　過去登録している電話番号などエラーが起きた場合のURL