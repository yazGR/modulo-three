Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  controller :finite_state_machines do
    match :machine, via: %i[get post]
  end
  root "finite_state_machines#machine"
end
