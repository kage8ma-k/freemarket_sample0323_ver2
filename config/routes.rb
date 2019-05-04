Rails.application.routes.draw do
  root 'items#index'
  resources :items,only: [:index, :edit, :show]
  resources :creditcards, only: [:index, :edit]
  resources :buy
  resources :users,only: [] do
    get 'personalinfomation'
    get 'logout'
  end
end
