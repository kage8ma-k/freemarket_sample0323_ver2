Rails.application.routes.draw do
  root 'items#index'
  resources :items,only: [:index, :edit, :new, :show]
  resources :creditcards, only: [:index, :new, :show, :edit] do
    collection do
      post 'register'
    end
  end
  resources :buy do
    collection do
      post 'pay'
    end
  end
  resources :users, only: [:show] do
    get 'personalinfomation'
    get 'logout'
    get 'profile'
  end
end
