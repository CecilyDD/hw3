Rails.application.routes.draw do
  resources :places do
    resources :entries, only: [:new, :create]
  end
  resources :entries, only: [:show]
end
