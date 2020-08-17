Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "boards#index"
  get "/pricing", to: "pages#pricing"
  get "/payment", to: "pages#payment"
  post "/checkout", to: "pages#checkout"

  namespace :api do
    namespace :v2 do
      resources :boards, only: [:index]
    end
  end


  resources :boards do 
    member do
      post :favorite
      put :hide
    end
    # resources :posts, only: [:index,:create,:new]
    resources :posts,shallow: true do
      resources :comments,shallow: true,only: [:create]
    end
  end
  resources :users, only: [:create,:edit,:update] do
    collection do
      get :sign_up
      get :sign_in
      post :login
      delete :sign_out
    end
  end
  resources :favorites,except: [:show,:edit,:new,:create] 
  # resources :posts, except: [:index,:show,:new]
  
  # get "/", to: "boards#index"
  # get '/about', to: "pages#about"
end
