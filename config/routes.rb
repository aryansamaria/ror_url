Rails.application.routes.draw do
 
  root 'links#index'

  resources :links, except: :index do
    
    resources :comments, only: [:create, :edit, :update, :destroy]
    collection do 
      get :showcase
    end
    post 'generate_summary', on: :member
    get 'show_summary', on: :member

  end
  delete '/links/:link_id/comments/:id', to: "comments#destroy"
  get '/comments' => 'comments#index'

  # get 'scrape', to: 'pages#scrape_data', as: :scrape_data
  
  get '/links/:id/upvote', to: 'links#upvote', as: 'upvote_link'
  get '/links/:id/downvote', to: 'links#downvote', as: 'downvote_link'
  
  
  

 
  get '/comments' => 'comments#index'
  
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  # delete 'logout', to: 'sessions#destroy', as: 'logout'
  get "/logout", to: "sessions#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
