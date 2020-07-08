Rails.application.routes.draw do
  root "items#index"
  resources :items do
    collection do
      get 'search'
    end
  end
end
