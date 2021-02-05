Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :photos, only: [ :new , :create, :show  ]
end
