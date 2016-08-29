Rails.application.routes.draw do
  resources :catalogos do
    resources :cds
    resources :vinilos
  #  resources :ventas
  end

  resources :ventas
  resources :pedidos do
    member do
      get 'cancel_order'
      get 'receive_order'
    end
  end

  root 'catalogos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
