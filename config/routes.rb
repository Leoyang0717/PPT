Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "boards#index"

  resources :boards do 
    # resources :posts, only: [:index,:show,:new]
    resources :posts,shallow: true
  end
  resources :users, only: [:create,:edit,:update] do
    collection do
      get :sign_up
      get :sign_in
      post :login
      delete :sign_out
    end
  end
  # resources :posts, except: [:index,:show,:new]
  
  # get "/", to: "boards#index"
  # get '/about', to: "pages#about"
end
