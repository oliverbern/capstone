Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :line_items
 
  resources :carts

  resources :jewelleries do
  collection { post :import }
    collection { post :search, to: "jewelleries#index" }
  end

  resources :colordiamonds do
  collection { post :import }
    collection { post :search, to: "colordiamonds#index" }
  end

  resources :diamonds do
  collection { post :import }
    collection { post :search, to: "diamonds#index" }
  end

    devise_for :users
  
  resources :colorgems do
    collection { post :import }
    collection { post :search, to: "colorgems#index" }
    get :autocomplete_colorgem_gemstonetype, :on => :collection
  end

   resources :messages
  resources :conversations do
    collection do
      post 'add_request', to: 'conversations#add_request'
    end 
  end

  get 'welcome/home'
  get 'welcome/about'
  get 'welcome/contact'
  get 'welcome/upgrade'
  get 'welcome/ownerlist'
  post 'welcome/import'
  get 'welcome/mailbox'
  get 'welcome/testpage'
  get 'koudoku/index'

  root 'welcome#home'
end
