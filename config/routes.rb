Rails.application.routes.draw do
 
  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  #ユーザー用
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :admin do
    get '/' => 'homes#top'
    resources :recipes, only: [:show, :edit, :update, :destroy]
    resources :comments, only: [:index, :show, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
  end
  
  scope module: :public do
    root to: "homes#top"
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resources :users, only: [:show, :edit, :update]
    get 'users/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'users/withdraw' => 'customers#withdraw', as: 'withdraw'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
