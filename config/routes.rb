Rails.application.routes.draw do
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
