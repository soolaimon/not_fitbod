Rails.application.routes.draw do
  resources :users do
    resources :workouts, only: [:index, :create]
  end
end
