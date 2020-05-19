Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  
  devise_scope :user do
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  
  
  $date = Time.now.in_time_zone('Tokyo').to_s
  root "items#index"
  resources :items do
    # 以下はビュー表示用の仮アクション
    collection do
      get "item_create" ,to: 'items#create'
      get "item_update" ,to: 'items#update'
      get "item_destroy",to: 'items#destroy'
    end
  end
  resources :users, only: :show 
end

