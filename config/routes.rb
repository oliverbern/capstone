Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :jewelleries do
  collection { post :import }
    
  end

  resources :colordiamonds do
  collection { post :import }
    
  end

  resources :diamonds do
  collection { post :import }
    
  end

    devise_for :users, :controllers => { registrations: 'registrations' }

  
  resources :colorgems do
    collection { post :import }
    collection do
      get :search, to: "colorgems#index"
    end
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
  get 'welcome/export'
  post 'welcome/import'
  get 'welcome/mailbox'
  get 'welcome/testpage'
  #get 'koudoku/index'
  mount Koudoku::Engine, at: 'koudoku'
  scope module: 'koudoku' do
    get 'pricing' => 'subscriptions#index', as: 'pricing'
  end

  root 'welcome#home'
end
