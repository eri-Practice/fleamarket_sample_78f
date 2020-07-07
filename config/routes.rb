Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
    #root "items#index"
  #get "toppage/index"
  # root "toppage#index"
  #resources :items do
    #collection do
      #get 'search'
    #end
  resources :users
  #end
end
