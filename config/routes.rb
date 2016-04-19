Rails.application.routes.draw do
  devise_for :tourists
  devise_for :students

  root "homes#index"

  devise_scope :student do
    get "students/sign_out" => "devise/sessions#destroy"
  end

  devise_scope :tourist do
    get "tourists/sign_out" => "devise/sessions#destroy"
  end

  resources :schools, only: [:index, :show]

  # possibly nest students under schools?
  resources :students, only: [:index, :show, :new, :create]

  resources :homes, only: [:index]

  resources :tourists, only: [:show]
end
