Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create]

  get 'heroines/:power_id/filter', to: 'heroines#power_filter', as: 'power_filter'

  root 'heroines#index'
end
