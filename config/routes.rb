OreLocations::Application.routes.draw do

  root :to => "servers#index"

  
  get 'server/:server'    => "home#index", :as => :server
  get 'reset_all' => "ore_nodes#reset_all"

  resources :servers do
    resources :maps do
      get 'new_ores'
      get 'magnify', on: :member
    end

    post 'ore_nodes/map/:map_id'    => "ore_nodes#create"
  end

  post 'ore_nodes/delete/:id'  => "ore_nodes#delete"  
  post 'ore_nodes/confirm/:id' => "ore_nodes#confirm"  

  resources :sessions

  get "login"  => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"
end
