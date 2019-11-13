Rails.application.routes.draw do
  resources :projects
  devise_for :users

  resources :projects do
    resources :works, only: [:index, :create]
  end

  get 'users/my_projects', to: 'users#my_projects', as: 'my_project'

  root to: 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
