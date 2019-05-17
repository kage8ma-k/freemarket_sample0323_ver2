Rails.application.routes.draw do
  root 'items#index'
  resources :items,only: [:index, :edit, :new, :show]
  resources :creditcards, only: [:index, :new, :show, :edit] do
  end
  resources :buy do
    collection do
      post 'purchase'
    end
  end
  resources :users, only: [:show] do
    get 'personalinfomation'
    get 'logout'
    get 'profile'
  end
end
