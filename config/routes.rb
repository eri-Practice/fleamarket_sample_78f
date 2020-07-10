Rails.application.routes.draw do
  root 'items#index'
  resources :items, except: :index do
    collection do
      get 'search'
    end
  end
end
