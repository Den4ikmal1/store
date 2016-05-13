Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)
  resources :orders, except: [:index, :show]
  devise_for :users
  resources :products do
    resources :reviews, except: [:index]
  end
  resources :cities do
    get 'search', on: :collection
  end

  get 'add_to' => "cities#add_to"
  get 'delete' => "cities#delete"

  resources :line_items, except: [:index]
  resources :carts, except: [:index]
  resources :categories 
  root 'products#index'


 
end
