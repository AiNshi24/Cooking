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
    resources :recipes, only: [:show, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :users, only: [:index, :show, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
  end
  
  scope module: :public do
    root to: "homes#top"
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    post 'guests/guest_sign_in' => 'guests#guest_sign_in'
    resources :users, only: [:show, :edit, :update] do
      get :book_marks, on: :member
      resources :food_stocks, only: [:create, :index, :destroy]
    end
    get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
    get 'recipes/search' => 'recipes#search'
    resources :recipes do 
      resources :comments, only: [:create, :destroy]
      resource :book_marks, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
