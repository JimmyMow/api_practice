Directions::Application.routes.draw do
  root to: "directions#new"
  resources :directions
end
