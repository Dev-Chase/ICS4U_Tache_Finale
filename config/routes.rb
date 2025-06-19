Rails.application.routes.draw do
  devise_for :utilisateurs, path: '', path_names: {
    sign_in: "utilisateur/sign_in",
    sign_out: "utilisateur/sign_out",
    registration: "utilisateur/sign_up"
  }
  resources :utilisateurs, only: [:show, :index] do
    resources :amis, only: [:destroy, :create]
  end
  resources :signalements
  resources :publications do
    resources :likes, only: [:create, :destroy]
    resources :commentaires, only: [:create, :destroy]
    resources :enregistres, only: [:destroy]
  end
  resources :commentaires, only: [:index]
  resources :likes, only: [:index]
  resources :amis, only: [:index]
  resources :enregistres, only: [:show, :create]
  resources :utilisateur_dossiers do
    resources :enregistres, only: [:index]
  end
  root to: "home#page"
  get "home/publications_amis", to: "home#publications_amis", as: "publications_amis"
  get "home/mes_publications", to: "home#mes_publications", as: "mes_publications"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
