Rails.application.routes.draw do
  get "orders/new"
  get "mypage/show"
  devise_for :users
  # 商品登録
  get 'products/new', to: 'products#new', as: 'new_product' 
  post 'products', to: 'products#create'  # 登録

  # 商品一覧
  get 'products', to: 'products#index'

  # 商品詳細
  get 'products/:id', to: 'products#show', as: 'product'

  # 商品編集
  get 'products/:id/edit', to: 'products#edit', as: 'edit_product'
  patch 'products/:id', to: 'products#update' # 編集

  #商品削除
  delete 'products/:id', to: 'products#destroy', as: 'destroy_product'

  # トップページ
  root to: "homes#top"

  # 省略
  resources :mypage, only: [:show] # ユーザ情報の詳細表示

   # 注文入力・注文作成
 resources :orders, only: [:index, :new, :create] do 
   collection do
     post :confirm   # 注文確認
   end

   member do
     get :complete  # 注文完了
   end
 end
end
