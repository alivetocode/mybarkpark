BarkPark::Application.routes.draw do
  resources :owners, only: :none do
    resources :dogs
  end

  resources :dogs
  resources :parks do
    resources :check_ins
  end



  get "pages/index" # creates custom route to index action in the pages controller
  devise_for :owners # devise creates this route when using devise model generator
  root to: "pages#index" #sets the root path

end
