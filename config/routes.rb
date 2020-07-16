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
      get 'category'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

end

