Rails.application.routes.draw do
  devise_for :tourists
  devise_for :students

  root "homes#index"

  resources :schools, only: [:index, :show]
    resources :students, only: [:index, :show]
  resources :homes, only: [:index]
end
