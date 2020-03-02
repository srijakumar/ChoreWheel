Rails.application.routes.draw do
  resources :chores do
    #nested routes here
    resources :tasks do
      member do #since completed at is part of tasks
        patch :complete
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
