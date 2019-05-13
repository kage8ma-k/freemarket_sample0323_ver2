Rails.application.routes.draw do
  root 'items#index'
  resources :items,only: [:index, :edit, :new, :show]
  resources :creditcards, only: [:index, :new, :show] do
  end
  resources :buy do
    collection do
      post 'purchase'
    end
  end
  resources :users, only: [:index] do
    get 'personalinfomation'
    get 'logout'
  end
end
