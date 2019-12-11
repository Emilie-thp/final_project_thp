Rails.application.routes.draw do
  
	root to: 'static_pages#home'

  devise_for :admins
  resources :articles, only: [:index, :show]
  resources :projects, only: [:index, :show]
  resources :project_categories
  resources :categories
  resources :contacts, only: [:new, :create]
  resources :events, only: [:index, :show]

  namespace :dashboard do
    resources :admins, only: [:show, :edit, :update] do
      resources :avatars
    end
    resources :categories
    resources :events do
      member do    
        patch :update_published
        put :update_published
      end
    end
    resources :contacts, only: [:index, :show]
    resources :projects do
      resources :pictures
      resources :thumbnails
      member do
        patch :update_published
        put :update_published
      end
    end
    resources :articles do
      resources :images
      member do
        patch :update_published
        put :update_published
      end
    end
  end

end
