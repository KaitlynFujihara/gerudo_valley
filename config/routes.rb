Rails.application.routes.draw do
  root 'welcome#index'
  resources :products
  resources :reviews
end
