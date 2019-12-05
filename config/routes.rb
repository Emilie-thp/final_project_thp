Rails.application.routes.draw do
  
	root to: 'static_pages#home'

  devise_for :admins
  resources :admins, only: [:show]
  resources :articles, only: [:index, :show]
  resources :projects, only: [:index, :show] 
  resources :project_categories
  resources :categories

  namespace :dashboard do 
    resources :articles, :categories
    resources :projects do
      resources :pictures
    end
    
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
