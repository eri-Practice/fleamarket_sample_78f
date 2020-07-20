Rails.application.routes.draw do


  devise_for :users,  :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }

  resources :users, only: [:show, :index, :new, :create] do
    collection do
      get:logout
      get:credit_card
    end
  end

  root "items#index"
  resources :items do
    collection do
      get 'search'
    end
    member do
      get 'buy', to: 'items#buy'
    end
  end

end

