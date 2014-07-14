Beerchive::Application.routes.draw do
  resources :beers

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'beers#index', as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'homes#index'
  end
end
