Rails.application.routes.draw do
  resources :badges, only: %i(show new create)

  root to: 'badges#new'
end
