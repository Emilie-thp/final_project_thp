Rails.application.routes.draw do
  
  get 'events/index'
  get 'events/show'
	root to: 'static_pages#home'

  devise_for :admins
  resources :articles, only: [:index, :show]
  resources :projects, only: [:index, :show] 
  resources :project_categories
  resources :categories
  resources :contacts, only: [:new, :create]
  resources :events, only: [:index, :show] 

  namespace :dashboard do 
    resources :admins, only: [:show]
    resources :articles, :categories
    resources :contacts, only: [:index, :show]
    resources :events, only: [:index, :show]
    resources :projects do
      resources :pictures
      resources :thumbnails
    end
  end

end
