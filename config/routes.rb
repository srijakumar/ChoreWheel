Rails.application.routes.draw do

  get 'auth/:provider/callback' =>'sessions#create'
  get '/login' => 'sessions#new'
  post '/sessions'=> 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, :only => [:index, :new, :create]

  resources :chores do
    #nested routes here
    resources :tasks do
      member do #since completed at is part of tasks
        patch :complete
      end
      resources :lists
    end
  end

  root "chores#index"



  end
