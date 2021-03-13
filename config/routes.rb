Rails.application.routes.draw do
  root :to => 'home#index'
  get '/products', :to => 'products#index'
  mount ShopifyApp::Engine, at: '/'
  devise_for :users
  # root to: 'pages#home'

  resources :ab_tests do
    resources :segments, only: [:new, :create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'ab_test_data', to: 'ab_tests#ab_test_data'
    end
  end
end
