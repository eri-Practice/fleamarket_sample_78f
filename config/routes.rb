Rails.application.routes.draw do
  get 'items/index'
  get "users/show"
  get "users/logout"
  get "users/credit_card"
  devise_for :users,  :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  resources :users
  root "items#index"
  resources :items do
    collection do
      get 'search'
    end
  end

end

