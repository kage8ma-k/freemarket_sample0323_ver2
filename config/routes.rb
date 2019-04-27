Rails.application.routes.draw do
  root 'items#index'
  resources :items

  get 'creditcards/index'
  get 'creditcards/edit'

end
