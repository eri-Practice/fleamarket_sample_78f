Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, except: :index do
    collection do
      get 'search'
    end
  end
end
