Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :neighbors_settings, only: [:edit, :update] do
      member do
        get :add_neighbor
      end
    end


    resources :products do
      member do
        get :neighbors
      end
    end
    resources :neighbors, only: [:delete]
  end
end
