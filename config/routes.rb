Rails.application.routes.draw do
  resources :projects
  devise_for :users
  get 'project/:id', to: 'works#create', as: 'new_work'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
