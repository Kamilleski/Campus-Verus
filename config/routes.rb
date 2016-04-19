Rails.application.routes.draw do
  devise_for :tourists
  devise_for :students

  root "homes#index"

  resources :schools, only: [:index, :show]
    resources :students, only: [:index, :show, :new, :create]

  resources :homes, only: [:index]

  resources :tourists, only: [:show]
end
