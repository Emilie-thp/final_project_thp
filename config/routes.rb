Rails.application.routes.draw do
  
	root to: 'static_pages#home'

  devise_for :admins
  resources :admins, only: [:show]
  resources :articles, only: [:index, :show]
  resources :projects, only: [:index, :show] do
    resources :pictures
  end
  resources :project_categories
  resources :categories

  namespace :dashboard do 
  	resources :articles, :projects, :categories 
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
