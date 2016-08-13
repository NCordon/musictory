Rails.application.routes.draw do
  resources :catalogos

  root 'catalogos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
