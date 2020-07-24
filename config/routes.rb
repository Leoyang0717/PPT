Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards
  root "boards#index"
  # get "/", to: "boards#index"
  # get '/about', to: "pages#about"
end
