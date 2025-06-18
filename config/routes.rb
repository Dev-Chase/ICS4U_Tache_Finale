Rails.application.routes.draw do
  devise_for :utilisateurs, path: '', path_names: {
    sign_in: "utilisateur/sign_in",
    sign_out: "utilisateur/sign_out",
    registration: "utilisateur/sign_up"
  }
  resources :utilisateurs, only: [:show, :index] do
    resources :amis, only: [:destroy]
  end
  resources :signalements
  resources :notifications
  resources :publications do
    resources :likes, only: [:create, :destroy]
    resources :commentaires, only: [:destroy, :create]
  end
  resources :commentaires, only: [:index] # TODO: implement index to only show my comments on posts (render publication_list)
  resources :likes, only: [:index]
  resources :amis, except: [:destroy]
  resources :enregistres
  resources :utilisateur_dossiers
  root to: "home#page"
  get "home/publications_amis", to: "home#publications_amis", as: "publications_amis"
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
