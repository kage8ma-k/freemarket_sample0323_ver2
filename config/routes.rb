Rails.application.routes.draw do
  root 'items#index'
  resources :items,only: [:index, :edit, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
  resources :creditcards, only: [:index, :edit]
  resources :buy
  resources :users,only: [] do
    get 'personalinfomation'
    get 'logout'
  end
end
