Rails.application.routes.draw do


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
    end
  end

  root "chores#index"



  end
