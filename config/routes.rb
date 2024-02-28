Rails.application.routes.draw do
  root 'places#index' # Set the root route to the places#index action
  resources :places do
    resources :entries, only: [:new, :create]
  end
  resources :entries, only: [:show]
end
