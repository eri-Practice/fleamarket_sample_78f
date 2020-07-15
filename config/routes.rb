Rails.application.routes.draw do
  get 'items/index'
  # resources :users

  resources :users, only: [:show, :index, :new, :create] do
    collection do
      get:logout
      get:credit_card
    end
  end

  devise_for :users,  :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  root "items#index"
  resources :items do
    collection do
      get 'search'
    end
  end

end

