Rails.application.routes.draw do

  # TODO: `root to:` の設定も後ほどお願いします！
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'

  resources :clean_companies
end