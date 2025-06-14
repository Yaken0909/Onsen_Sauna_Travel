Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/destroy'
  end
  namespace :admin do
    get 'post_images/index'
    get 'post_images/destroy'
  end
  # Deviseユーザー認証
  devise_for :users

  # トップページ
  root to: 'homes#top'

  # 投稿機能（PostImages）
  resources :post_images do
    resource :favorite, only: [:create, :destroy]

  end
  
  # ユーザープロフィール閲覧・編集
  resources :users, only: [:show, :edit, :update]

  

  # その他静的ページ
  get 'homes/about', to: 'homes#about'
end