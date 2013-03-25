Fabfoundationworld::Application.routes.draw do
  resources :labs do
    collection do
      :map
    end
  end
  root to: 'labs#map'
end
