Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)
  resources :orders, except: [:index, :show]
  devise_for :users
  resources :products do
    resources :reviews, except: [:index]
  end
  resources :cities

  resources :line_items, except: [:index]
  resources :carts, except: [:index]
  resources :categories 
  root 'products#index'
 
end
