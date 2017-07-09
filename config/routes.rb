Rails.application.routes.draw do

  # TODO: `root to:` の設定も後ほどお願いします！
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users
  resources :clean_companies do
    resources :clean_reviews
  end
  
  resources :clean_companies do
    resources :contact
  end
end