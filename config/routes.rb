Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
    root to: 'tasks#index'

   # Add a route for tasks#index

    get '/tasks/new', to: 'tasks#new', as: :new_task



    get '/tasks', to: 'tasks#index', as: :tasks
    post '/tasks', to: 'tasks#create'


    get '/tasks/:id/edit', to: 'tasks#edit', as: :edit_tasks

    patch '/tasks/:id', to: 'tasks#update'


   # Route for tasks#show
   get '/tasks/:id', to: 'tasks#show', as: :task

    delete '/tasks/:id', to: 'tasks#destroy'

end
