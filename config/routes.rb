Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'genres/index'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  get 'orders/new'
  get 'orders/confirm'
  get 'orders/thanks'
  get 'orders/index'
  get 'orders/show'
  get 'addresses/index'
  get 'addresses/edit'
  get 'carts/index'
  get 'items/show'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'homes/top'
  get 'homes/about'
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end