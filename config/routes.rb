Rails.application.routes.draw do
  
	root to: 'static_pages#home'

  devise_for :admins

#routes for visitors' website
  resources :articles, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :projects, only: [:index, :show]
  resources :contacts, only: [:new, :create]

#routes for admins' dashboard
  namespace :dashboard do

    resources :categories
    resources :contacts, only: [:index, :show]

    resources :admins, only: [:show, :edit, :update] do
      #for active_storage 
      resources :avatars
    end
    resources :events do
      # to define another update methode (dedicated to online / offline mode)
      member do    
        put :update_published
      end
    end

    resources :projects do
      #for active_storage 
      resources :pictures, only: [:create, :destroy]
      resources :thumbnails, only: [:create, :destroy]
      # to define another update methode (dedicated to online / offline mode)
      member do
        put :update_published
      end
    end

    resources :articles do
      #for active_storage 
      resources :images, only: [:create, :destroy]
      # to define another update methode (dedicated to online / offline mode)
      member do
        put :update_published
      end
    end
    
  end

end
