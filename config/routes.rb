Rails.application.routes.draw do
  root 'items#index'
  resources :items,only: [:index, :edit]
  resources :creditcards, only: [:index, :edit]
  resources :buy
  resources :users,only: [] do
    get 'personalinfomation'
  end
end
