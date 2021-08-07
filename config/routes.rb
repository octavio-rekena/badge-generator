Rails.application.routes.draw do
  resources :badges, only: %i(index show new create)
  
  resources :badge_generators, only: :update, path: :generate 

  root to: 'badges#index'
end
