Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lists#index"
  resources :movies
  resources :lists, only: [:index, :show, :new, :create] do
    # ici selon l'énoncé on place bookmark en tant qu'enfant de lists.
    # on aurait pu aussi le faire dans movies
    # mais pas dans les 2 à la fois
    resources :bookmarks, only: [:new, :create]

  end
  # ici on sépare le destroy du chemin du new et du create car
  # le bookmark qu'on veut delete a un id
  # alors que pour new et create on a besoin de l'id de lists
  resources :bookmarks, only: [:destroy]

end
