Rails.application.routes.draw do
  

  get 'password_reset#new'
  get 'password_reset#edit'
  post 'password'
  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
  }
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update] 

  
  
  devise_scope :user do
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  $date = Time.now.in_time_zone('Tokyo').to_s
  
  root "items#index"

  resources :categories, only: [:index] do
    member do
      get 'parent'
      get 'child'
      get 'grandchild'
    end
  end

  resources :items, only: [:index, :new, :create, :show, :edit, :destroy] do
    member do
      get "purchase"
      get "done"
    end
  end
  
  resources :users, only: [:new, :show, :edit, :update] do
    collection do
      get "signin"
    end
  end
  
  
  resources :users,     only: [:show, :index, :edit, :update] do
    get 'edit_detail', to: 'users#edit_detail'
    patch 'update_detail', to: 'users#update_detail'
  end


  resources :addresses, only:[:edit, :update] do
    get 'edit', to:'addresses#edit'
    patch 'update', to: 'addresses#update'
  end  
  
  resources :mypage, only: [:index, :show, :new, :edit, :create] do
    collection do
      get "logout"
    end   
  end
end

