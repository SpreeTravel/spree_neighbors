Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :neighbors_settings
  end
end
