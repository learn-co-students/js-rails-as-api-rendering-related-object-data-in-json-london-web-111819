Rails.application.routes.draw do
  resources :sightings
  get '/birds' => 'birds#index'
  get '/sightings/:id' => 'sightings#show', as: 'sighting'
end