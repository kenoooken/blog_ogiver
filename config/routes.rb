Rails.application.routes.draw do
    
    post "posts/:id/destroy" => "posts#destroy"
    root 'posts#index'
    
  devise_for :users
    
    
    resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
    
    resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member 
    get :followers, on: :member 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
