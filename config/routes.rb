Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
}

  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations',
  passwords: 'users/passwords',
}


  root 'homes#top'
  get '/about' => 'homes#about'
  resources :users, only: [:show, :edit, :update]
  get 'items/:id' => 'items#show', as: 'item'
  resources :carts, only: [:index, :create, :update, :destroy]
  resources :addresses, except: [:show, :new] #この２つを除外

  post 'carts/destroy_all' => 'carts#destroy_all', as: 'destroy_all'

  get 'orders/new' => 'orders#new'
  post 'orders/confirm' => 'orders#confirm'
  post 'orders' => 'orders#create'
  get 'orders/thanks' => 'orders#thanks'
  get 'order_histories' => 'orders#index'
  get 'order_histories/:id' => 'orders#show', as:'order_histories_show'


  namespace :admin do
    root 'homes#top'
  end

  namespace :admin do
	resources :items, except: [:destroy]
  end

  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :orders, only: [:index, :show, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end