Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :accounts
      resources :medias
      resources :metadatas
      resources :audios
      resources :videos
      
      get '/show_media/:id', to:'accounts#show_media'
      get '/show_media_by_code/:id', to:'accounts#show_media_by_code'
    end
  end
end
