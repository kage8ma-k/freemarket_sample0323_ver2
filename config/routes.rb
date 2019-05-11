Rails.application.routes.draw do

  resources :items

  root 'items#index'


  devise_for :users, skip: :all
  devise_scope :user do
    get    'login'                        =>  'users/sessions#new', as: :new_user_session
    post   'login'                        =>  'users/sessions#create', as: :user_session
    delete 'logout'                       =>  'users/sessions#destroy', as: :destroy_user_session
    get    'signup'                       =>  'users/registrations#new', as: :new_user_registration
    post   'signup'                       =>  'users/registrations#create', as: :user_registration
    get    'signup/registration'          =>  'users/registrations#new1' # 名前やメールアドレスの入力
    post   'signup/registration'          =>  'users/registrations#create1'
    get    'signup/sms_confirmation'      =>  'users/registrations#new2'  # 携帯電話番号の入力（SMS認証）
    post   'signup/sms_confirmation'      =>  'users/registrations#create2'
    get    'signup/sms_confirmation/sms'  =>  'users/registrations#new3'  # 携帯電話番号の重複などのエラー
    post   'signup/sms_confirmation/sms'  =>  'users/registrations#create3'
    get    'signup/input_address'         =>  'users/registrations#new4'  # お届け先住所の入力
    post   'signup/input_address'         =>  'users/registrations#create4'
    get    'signup/input_payment'         =>  'users/registrations#new5'  # お支払い方法の入力
    post   'signup/input_payment'         =>  'users/registrations#create5'
    get    'signup/complete'              =>  'users/registrations#new6'  # 確認ページ
    post   'signup/complete'              =>  'users/registrations#create6'
    get    'signup/cancel'                =>  'users/registrations#cancel', as: :cancel_user_registration
    get    'user'                         =>  'users/registrations#edit', as: :edit_user_registration
    patch  'user'                         =>  'users/registrations#update', as: nil
    put    'user'                         =>  'users/registrations#update', as: :update_user_registration
    delete 'user'                         =>  'users/registrations#destroy', as: :destroy_user_registration
    get    'password'                     =>  'users/passwords#new', as: :new_user_password
    post   'password'                     =>  'users/passwords#create', as: :user_password
    get    'password/edit'                =>  'users/passwords#edit', as: :edit_user_password
    patch  'password'                     =>  'users/passwords#update'
    put    'password'                     =>  'users/passwords#update', as: :update_user_password
  end

end