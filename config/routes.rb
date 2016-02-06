Rails.application.routes.draw do
  resources :videos, only: [:index, :new, :create, :show, :edit]

  root :to => 'videos#index'
end
