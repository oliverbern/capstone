Rails.application.routes.draw do


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
  get 'welcome/privacy_policy'
  get 'welcome/testpage'
  get 'charges/upgrade'
  get 'welcome/admin'
  get 'welcome/about'
  get 'welcome/imprint'
  get 'welcome/terms_and_conditions'
  #get 'koudoku/index'
  

  resources :charges, only: [:new, :create]

  root 'welcome#home'
end
