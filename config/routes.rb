Rails.application.routes.draw do
  root "homes#index"

  resources :schools, only: [:index, :show]
  resources :homes, only: [:index]
end
