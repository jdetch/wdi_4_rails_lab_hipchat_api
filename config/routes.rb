Rails.application.routes.draw do
  root 'pokes#new'
  resources :pokes, only: [:show, :new, :create]
end
