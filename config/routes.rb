Rails.application.routes.draw do
  get 'items/index'
  # resources :users

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
