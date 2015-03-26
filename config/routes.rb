Shortener::Engine.routes.draw do
  root to: 'application#home'
  get ':key', to: 'urls#show'
end