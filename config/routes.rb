Rails.application.routes.draw do
  post 'orders' => 'orders#create'
  delete 'orders/:id/destroy' => 'orders#destroy'

  root 'products#root'
  resources :products do
    resources :reviews, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
