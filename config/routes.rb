Rails.application.routes.draw do
  resources :projects
  devise_for :users

  resources :projects do
    resources :works, only: [:index, :create]
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
