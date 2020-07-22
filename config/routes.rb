Rails.application.routes.draw do
  resources :dogs, only: [:show, :index]
  resources :employees, only: [:show, :index, :edit, :new, :update, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
