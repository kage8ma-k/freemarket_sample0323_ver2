Rails.application.routes.draw do

  resources :items

  root 'items#index'
  get '/items/new/search' => 'items#search'
  resources :items,only: [:index, :edit, :new, :create, :show, :edit, :update] do
  end
  resources :creditcards, only: [:index, :new, :show, :edit] do
    collection do
      post 'register'
      post 'dele'
    end
  end
  resources :buy do
    collection do
      post 'pay/:id' => 'buy#pay', as: 'pay'
    end
  end
  resources :users, only: [:show] do
    patch '/users', to: 'users#update', as: 'update'
    get 'personalinfomation'
    get 'logout'
    get 'profile'
  end

  # devise_for :users, skip: :all
  devise_for :users, { only: [:omniauth_callbacks], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } }
  devise_scope :user do
    # get    'signup/facebook_reg'          =>  'users/omniauth_callbacks#facebook', as: :facebook_user_registration
    # post   'signup/facebook_reg'          =>  'users/omniauth_callbacks#facebook'
    get    'login'                        =>  'users/sessions#new', as: :new_user_session
    post   'login'                        =>  'users/sessions#create', as: :user_session
    delete 'logout'                       =>  'users/sessions#destroy', as: :destroy_user_session
    get    'signup'                       =>  'users/registrations#new', as: :new_user_registration
    post   'signup'                       =>  'users/registrations#create', as: :user_registration
    get    'signup/registration'          =>  'users/registrations#reg_first_view' # 名前やメールアドレスの入力
    post   'signup/registration'          =>  'users/registrations#reg_first_post'
    get    'signup/sms_confirmation'      =>  'users/registrations#reg_second_view'  # 携帯電話番号の入力（SMS認証）
    post   'signup/sms_confirmation'      =>  'users/registrations#reg_second_post'
    get    'signup/sms_confirmation/sms'  =>  'users/registrations#reg_third_view'  # 携帯電話番号の重複などのエラー
    post   'signup/sms_confirmation/sms'  =>  'users/registrations#reg_third_post'
    get    'signup/input_address'         =>  'users/registrations#reg_forth_view'  # お届け先住所の入力
    post   'signup/input_address'         =>  'users/registrations#reg_forth_post'
    get    'signup/input_payment'         =>  'users/registrations#reg_fifth_view'  # お支払い方法の入力
    post   'signup/input_payment'         =>  'users/registrations#reg_fifth_post'
    get    'signup/complete'              =>  'users/registrations#reg_final_view'  # 確認ページ
    post   'signup/complete'              =>  'users/registrations#reg_final_post'
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
