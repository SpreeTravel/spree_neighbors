Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :neighbors_settings, only: [:edit]

    resources :products do
      member do
        get :neighbors
      end
    end
  end
end
