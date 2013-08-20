Flyer::Application.routes.draw do
  root to: 'main#index'  
  post '/flyer', to: 'main#flyer'
  get '/flyer', to: 'main#flyer'
end
