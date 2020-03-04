Rails.application.routes.draw do

  resources :users, :only => [:new, :create]

  resources :chores do
    #nested routes here
    resources :tasks do
      member do #since completed at is part of tasks
        patch :complete
      end
    end
  end

  #root "chores#index"

  root "users#new"

  end
