Rails.application.routes.draw do
  get 'items/index'
  devise_for :users,  :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
    root "items#index"
  resources :items do
    collection do
      get 'search'
    end
  resources :users
  end
end
