Rails.application.routes.draw do
  
	root to: 'static_pages#home'

  devise_for :admins
  resources :admins, only: [:show]
  resources :articles, only: [:index, :show]
  resources :projects, only: [:index, :show] 
  resources :project_categories
  resources :categories
  resources :contacts, only: [:new, :create]

  namespace :dashboard do 
    resources :articles, :categories
    resources :contacts, only: [:index, :show]
    resources :projects do
      resources :pictures
      resources :thumbnails
    end
  end

end
