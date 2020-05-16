Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
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
  resources :users, only: :show do
    # 以下はビュー表示用の仮アクション
    collection do
      get "new_session"
      get "new_user"
      get "new_address"
      get "create_address"
    end
  end  
end

