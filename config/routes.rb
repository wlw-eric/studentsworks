Rails.application.routes.draw do

  devise_for :users

  resources :projects do
    resources :works, only: [:index, :create, :destroy]
  end

  get 'users/my_projects', to: 'users#my_projects', as: 'my_project'
  post 'users/:id', to: 'projects#update_progress', as: 'update_progress'

  root to: 'pages#home'
  #root to: 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
