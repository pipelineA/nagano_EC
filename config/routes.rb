Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
}

  devise_for :customers
  devise_scope :customer do
    get 'users/sign_in' => 'users/sessions#new', as: :new_user_session
    post 'users/sign_in' => 'users/sessions#create', as: :user_session
    delete 'users/sign_out' => 'users/sessions#destroy', as: :destroy_user_session
    get 'users/sign_up' => 'users/registrations#new', as: :new_user_registration
    post 'users' => 'users/registrations#create', as: :user_registration
    get 'users/password/edit' => 'users/passwords#edit', as: :edit_user_password
    patch 'users/password' => 'users/passwords#update'
  end


  root 'homes#top'
  get '/about' => 'homes#about'
  resources :users, only: [:show, :edit, :update]
  get 'items/:id' => 'items#show'
  resources :carts, only: [:index, :create, :update, :destroy]
  resources :addresses, except: [:show, :new] #この２つを除外

  get 'orders/new' => 'orders#new'
  post 'orders/confirm' => 'orders#confirm'
  post 'orders' => 'orders#create'
  get 'orders/thanks' => 'orders#thanks'
  get 'order_histories' => 'orders#index'
  get 'order_histories/:id' => 'orders#show'


  namespace :admin do
    root 'homes#top'
  end

  namespace :admin do
	resources :items, except: [:destroy]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :update]
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :orders, only: [:index, :show, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end