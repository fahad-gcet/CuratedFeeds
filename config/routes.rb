Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  resources :posts
  authenticated :user do
    root 'posts#feed', as: 'authenticated_root'
  end
  root 'posts#index'
  resources :users, only: [:edit, :update]

end
