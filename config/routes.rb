Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/show'
  get 'articles/new'
  get 'articles/edit'
  get 'projects/index'
  get 'projects/show'
  get 'projects/new'
  get 'projects/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
