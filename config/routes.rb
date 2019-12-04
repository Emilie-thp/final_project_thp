Rails.application.routes.draw do
  
  get 'pictures/create'
  get 'pictures/destroy'
	root to: 'static_pages#home'

  devise_for :admins

  resources :articles
  resources :projects
  resources :project_categories
  resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
